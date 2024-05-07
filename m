Return-Path: <linux-leds+bounces-1632-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB25D8BEED7
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 23:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E54B1F262A6
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2024 21:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA2973539;
	Tue,  7 May 2024 21:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="CFnJjjXN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178054BDE;
	Tue,  7 May 2024 21:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715116992; cv=none; b=UunmMNjn5RDnCYq42mDaXLPSVnU7e371zr696Z2QxbxyGFW4x/MIBwd5aiwq6IvllGVjdspy4z5P9VyhOLEseM9ThN7k2lfHbKVzA6eLhr0kP2aQMYWb2TSGUN3eBvcLbXUleyd3kJ73Ey+V5mcYPIBCjZJQ3lwEVBhXmzCX7mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715116992; c=relaxed/simple;
	bh=MV44dzFlrz6ods5NuoQwWV90W5Uxc+Kx2sm6OddmSXI=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=tWLcxLzZzxtt5H3R2cUl29u9MKXCiLU4GdcQLrI4jgEX8otVppwerqwKJXRhBCZ++6GN3I9fz8KMvNj6TDbkIyVfxw55W/ixzi+MQPNViW88k8vBEX8iOQM4H8jMBXJ2ADUQJVo6dACgVeL2Tt7QuaTUJeefuHFa6Af0bNQihfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=CFnJjjXN; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715116960; x=1715721760; i=frank-w@public-files.de;
	bh=MV44dzFlrz6ods5NuoQwWV90W5Uxc+Kx2sm6OddmSXI=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CFnJjjXN1OZbj+P9i0tccPyHV/6gJ2bfEbpy2bK2MnXd7TO9tgChMit3wKNKE8wU
	 lC/eNc5YQSEb7g1DEiWuAwbHIp7Mlr57m0XR27J3CnWP6MJLssJPhpiohWTLeFTHa
	 gtmu6OPlnZlXj4m05U/x9jBgAehaQMxuu+y8SuVrLaVMNm6ittAAJZ5I5NHjEu+EU
	 57N7cZ+gkandkn9pyO+iM6RN+GoY/o0BbcVRVSQQr0cdJuxkRb7mgSd8D3c8X6Hzr
	 K/0D9gnoOFtHSetkaYtG3w/mGoQKeahVsd/MHu4Toz8DtJC7ZFSxlcoVqLYbi9C18
	 oVyFa/kqUepGP/j2Pw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.78.164] ([80.245.78.164]) by web-mail.gmx.net
 (3c-app-gmx-bap12.server.lan [172.19.172.82]) (via HTTP); Tue, 7 May 2024
 23:22:40 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-122794ca-3b8b-4609-b101-9550cb876acf-1715116960896@3c-app-gmx-bap12>
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Frank Wunderlich
 <linux@fw-web.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Pavel Machek
 <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Eric Woudstra
 <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Aw: Re:  Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add
 address-cells and size-cells to ethsys
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 May 2024 23:22:40 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20240507193557.GA924525-robh@kernel.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
 <9f8237c4-f603-459a-9d34-9cda556874b8@linaro.org>
 <trinity-9ceb52ff-9a3b-4fe2-93f8-2e95b8ffb1ee-1715014303393@3c-app-gmx-bap23>
 <20240507193557.GA924525-robh@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:lOjicJStoEZcBNfkrA1QWbzIQ4NNjFPQ8cpzR6gW4QiR+7EJh6RjwdVE3YYefeXOHDnBZ
 fpXIuCQU1BfhKqVuPUKwrkqaR1DCoavDO4uKE8Rk+YGYyqasvyKwJP/KZ8LewsqXNiVj1h7VtPTy
 qtM5hBPT8v4jEP3sBXbRwxl7OCVJ/X0GKbY856pCUyBoAtT6U+9hy44RN8xqUKlihW5m+kLDaln4
 Lc6uQdKWAVV4ACVM0Lr6CVzWC3lIbtUgdJAA0hJTBVv0dwVo1HSwjW7sFX+2xHx2L76UDJw64qtZ
 V0=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZHnKS6tQk9U=;6uTXHbkwN5EHrut8Rcoawy77HMH
 30XsiZh8MTBZKe3CVrFtSIsawDJlNIOWmz7UnJ8FjVYO6NKNdqzmcxUtWLyanlpcp9mvu9x/A
 6tIkE0KajZXcjV+YVDIyLOEzODGelQGgNac+TzjM9N+LSqN6EcxPaturfBd3yLWbO/jKZGRyy
 QM6BFwk1WaPFALHV44r360RApZalAViReb4f7fA46MWjpBIA/2jw1wG4deSIVtScZGxH1txGi
 Ptdbjv6LG2o5sCAVyUaW2C5Siqq2DqHrpqAh7S7dUQClafoOpU0PgJNKXjzShRADxAbM4dIwa
 lXVYN9iJGKCS1qKQ9hjO8A01mrWuN3IIey+elFLTdQ0WQgffczN06E9dq5qf5Zkp240dtghLb
 PTgjiNwfjMbM4RD5Z8yDMYXKnnOc/NToUteUacFM/YTxMvZsKStQdot24rosEpD7qhNmVcKxY
 qp8gr7YxZZb/ShKKf6zyDSCXj7eS4z2iv76r0Sm74MaGUtRs7V29x6+/5PlEo1fKdX/XTtbi+
 AnSp61OK1P+bjCkG7N3uXesrLoZcJZxxO9UZ92aSgsKelbEIQRxyGIXKpJ98v3T7fSWmrgQ8l
 F8ZlTGwFTNQLWfILL3JNcc39RKChROgFqBM4hLGCDdndIGu44PV8QuNyUka7pLsgS/rQAEpqo
 CtgEGMbbngYW+2jaC63gfLTdJlhLoibq7x+AnKUrGdPmJJiVas+WE8KO/ImSZJM=
Content-Transfer-Encoding: quoted-printable

Hi

> Gesendet: Dienstag, 07. Mai 2024 um 21:35 Uhr
> Von: "Rob Herring" <robh@kernel.org>

> The dts is already fixed dropping these properties in linux-next.
>
> If you don't have child nodes with reg/ranges, then you never need
> #address-cells or #size-cells.

thx for pointing to this,

so i only need part 4+5 when 6.10-rc1 is out (as i drop netdev trigger fro=
m dts in v2).

any comments for these?

regards Frank

