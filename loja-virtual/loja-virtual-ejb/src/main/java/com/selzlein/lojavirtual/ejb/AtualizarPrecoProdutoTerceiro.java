package com.selzlein.lojavirtual.ejb;

import com.whitestein.lsps.engine.ExecutableTask;
import com.whitestein.lsps.engine.TerminationReason;
import com.whitestein.lsps.engine.lang.TaskContext;
import com.whitestein.lsps.lang.Decimal;
import com.whitestein.lsps.lang.exec.RecordHolder;

/**
 * @author djeisonselzlein
 *
 */
public class AtualizarPrecoProdutoTerceiro implements ExecutableTask {

	@Override
	public Result processInput(TaskContext context, Object input) {
		return null;
	}

	@Override
	public Result start(TaskContext context) {
		try {
			RecordHolder produto = (RecordHolder) context
					.getParameter("item");

			Decimal valorAtual = (Decimal) produto.getProperty("valorUnitario");
			valorAtual = Decimal.valueOf(valorAtual.doubleValue()
					+ valorAtual.doubleValue() * 0.1);
			produto.setProperty("valorUnitario", valorAtual);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return Result.FINISHED;
	}

	@Override
	public void terminate(TaskContext context, TerminationReason reason) {
		// MŽtodo n‹o utilizado nesta tarefa
	}

}
