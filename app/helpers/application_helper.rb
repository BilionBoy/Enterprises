module ApplicationHelper
  include Pagy::Frontend

  def btn_submit(form)
    text = form.object.new_record? ? "Incluir" : "Atualizar"
    icon_class = "ph-paper-plane-tilt ms-1"

    button_tag(type: "submit", class: "btn btn-primary") do
      safe_join([ text, content_tag(:i, "", class: icon_class) ])
    end
  end

  def formatar_boolean_xlsx(value)
    value ? "Sim" : "Não"
  end

  def calcular_progresso(data_inicio, data_fim)
    return "0%" if data_inicio.nil? || data_fim.nil?

    hoje = Date.today

    if hoje >= data_inicio && hoje <= data_fim
      intervalo = (data_fim - data_inicio + 1).to_f
      progresso = ((hoje - data_inicio + 1).to_f / intervalo * 100).round(2)
      "#{progresso}"
    elsif hoje > data_fim
      "100%"
    else
      "0%"
    end
  end

  def formatar_data(data)
    return nil if data.blank?
    case data
    when Date
      data.strftime("%d/%m/%Y")
    when String
      return nil unless data.match(/\A\d{2}\/\d{2}\/\d{4}\z/)

      Date.strptime(data, "%d/%m/%Y").strftime("%d/%m/%Y")
    else
      nil
    end
  end

  def formatar_mes(mes)
    meses = [
      nil,        # índice 0 não é utilizado
      "Janeiro",
      "Fevereiro",
      "Março",
      "Abril",
      "Maio",
      "Junho",
      "Julho",
      "Agosto",
      "Setembro",
      "Outubro",
      "Novembro",
      "Dezembro"
    ]
    meses[mes.to_i] || "Mês inválido"
  end

  def formatar_inteiro(value)
    value.to_i
  end

  def opcoes_meses
    [
      [ "Janeiro", "01" ],
      [ "Fevereiro", "02" ],
      [ "Março", "03" ],
      [ "Abril", "04" ],
      [ "Maio", "05" ],
      [ "Junho", "06" ],
      [ "Julho", "07" ],
      [ "Agosto", "08" ],
      [ "Setembro", "09" ],
      [ "Outubro", "10" ],
      [ "Novembro", "11" ],
      [ "Dezembro", "12" ]
    ]
  end

  def opcoes_anos
    [ "2024", "2025", "2026", "2027", "2028" ]
  end

  def formatar_inteiro(value)
    value.to_i
  end

  def formatar_data_ano(ano)
    return nil if ano.blank?
    ano.to_s if ano.is_a?(Integer) && ano.to_s.length == 4 # Verifica se é um inteiro e tem 4 dígitos
  end

  def cor_status(atividade)
    case atividade
    when ASituacaoAchado::NAO_INICIADA
      "secondary"  # Cinza
    when ASituacaoAchado::PARADA
      "warning"  # Amarelo
    when ASituacaoAchado::CONCLUIDO
      "success"  # Verde
    when ASituacaoAchado::INICIADA
      "primary"  # Azul
    when ASituacaoAchado::ATRASADA
      "danger"  # Vermelho
    end
  end
end
