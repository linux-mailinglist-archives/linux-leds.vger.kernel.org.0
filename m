Return-Path: <linux-leds+bounces-1609-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE368BD20F
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 18:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D239F28546E
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 16:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F0D155757;
	Mon,  6 May 2024 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="ExcHQ71z"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1EB1DFE1;
	Mon,  6 May 2024 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011342; cv=none; b=a9PDfcIcH+fNn8aZtiua8/IGXbg8HyFqHCx98NrtkWgxYcrr4vbz79AmlUqptcjLflw9YJ60ANYfsEri/bWzw1A1ld/qqYy7DlOIFJzsPyXXFlY5AD+gDIeXufnfIzsCXwI08JDmxX3dh1IVLh4C/0UjUWD8hjQfcBaA7NC5Fbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011342; c=relaxed/simple;
	bh=z8G8tzytL5EQJL54ZG7dt8auAwYgJmpRiWb3yoTVl6A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=d/DsH7FcslO5k0EiBvBjK633tEo+nhFCahXvO9ZJkQB2gNdX49kot7Dh2dB+xKFEOr9tDI705v7/oi8tzF99b69pMjU3TGqZsL1L6jaXZsm0IFyNupmaADUuCrBSXmfh5PD9WvOCMEGw9kIhTi9RLPwI7avxgvQxZ80VfsPYdss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=ExcHQ71z; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715011311; x=1715616111; i=frank-w@public-files.de;
	bh=z8G8tzytL5EQJL54ZG7dt8auAwYgJmpRiWb3yoTVl6A=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ExcHQ71zgurjKEdBE1RfioXtlPFtuD3xfIU6C4C1Y0Dp3ypHe3XMdw+3FcFi7+HN
	 iurm5slUeYgLTuFsKtj9PeiMRNJm69HUXK3yU+fp67Z7xgO5BDdtBGJbT08g9jTMF
	 hYrB5Es+ccDhCsAOZAD7X4AkjI2ksDf8qyuZCqdOBui3ALcZvCS52YkHkL20AOqZd
	 fBN4nWn/Cecd0J1O7R+fuj2t/DOqRHknfdQ0nsAW0DSUz6/UPVFpvV4Bx7XuJtxEB
	 SNGMmAYd2arH2VJW/zftRdxLg4/2c19aFLJex4+6VZd4t+QJ3eAMXBPUmkEe/p7mm
	 JuThOc9PRYQb6kVI3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.68.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1sezUm1vRX-00bI9k; Mon, 06
 May 2024 18:01:51 +0200
Date: Mon, 06 May 2024 18:01:50 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v1_2/5=5D_dt-bindings=3A_clock=3A_mediate?=
 =?US-ASCII?Q?k=3A_add_address-cells_and_size-cells_to_ethsys?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de> <20240505164549.65644-3-linux@fw-web.de> <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
Message-ID: <6A98D99E-C64E-441F-9496-EBF39141C4BA@public-files.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EvJGf3yoWCy1hX284ILeRzi5OdXlUzlOTm6wblWYTGCY8Ws6Gww
 F7hYZf+CSst1+2bF8ZcVqQR32B9zp54zWGXQfzaXne4jggfEFM10HfNaJnZo/GoiNsjFNL7
 Rp9FYBqM3ZT2UVnrAeXCqjFzh/nA6h/yLcEpN1U/e64eYymDbvscnf8W9A5AlDu/516Dsj5
 nMnxzjIWEVQqsafH40oIQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ozEtPywastQ=;SZFw/2RUdiC4ZRyq+jT9OWp3y8e
 TXsSCkPf4nMpTsh0sURQin0IEw0ytSyMs3ZFaw/rqP9fJmVA1OjtVgQwhPXSghltfPu78Fgm+
 fU0yMidKDEU+m9cr8kuUGOFKNUtoRZAWhcUpbAAqwWqWvwHuVJ9Zv/SEwYYGSXVawFe7NfSRw
 P56M3eI1MoZYazsfDHfvRcqWI1Wr2xrcf7F/kAyKvbeswb/zxU38cSqiAekgy/EPNojPx6hDi
 xjoWchYjcP0ebamQwZqT00J4yT8thVYwBsO6pw7D5lKiftQZcS4iMGiAdYk+GktA7HA3ATdXi
 1BZtYEscY+TjymFHiyMRXMs/dfJSuxjxlEayaZWtF8mcs/WEL/rN5PeBhzyUupUx8whfmHaja
 sdezjAa383PmYCT7p5cRx8WbV6Ml2InLlbwXaxW2HOlLKDztqbHnQUbPMFPn/xgOO63MiK24g
 p53lXb/XIVbmhRDBbiO4SXM44oPyF7aWzzeBrD5FcsJMTWZPy2NHZuQd4aKcwtBK3W02P7/dP
 o37R2PUGBfLgJ6vT3CXFwEDPVsb7IZNrJ6l5F7elG1rjyuyMeU+CM9DRlcDSgjcOeUB1W6H0s
 e7BH30r7KDB2pHgQimA1TFClJLjlOqiMq+32jzduoVB23BMT7gtE6ImKhB5g9m0EibFVwCrBH
 evXI2G5eHrdbgBxqfiFQu4j+wnBDGFFRco+vXlWTJ8dEK7KA4VBguqNCoBJ/z6ZGYc8UWCMKS
 iKDdoWRsY3PyZs7YTy9HG3eKbGVri/9EcSGMoa8n7stRIcj5PPNrq4fao5eJoQkwV5q6800M6
 GHlhwjOlNBPVKo+KJmLtwPfifaS+hjMkacc04b3MsskI4=

Am 6=2E Mai 2024 14:48:58 MESZ schrieb AngeloGioacchino Del Regno <angelogi=
oacchino=2Edelregno@collabora=2Ecom>:
>Il 05/05/24 18:45, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add missing properties already used in mt7986a=2Edtsi=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>
>Fixes tag? :-)
>
>Cheers,
>Angelo

Should i use fixes tag of binding commit or where dts (-part) was added?
regards Frank

