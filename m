Return-Path: <linux-leds+bounces-1801-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD68D6FB5
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 14:15:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2011A1F21843
	for <lists+linux-leds@lfdr.de>; Sat,  1 Jun 2024 12:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093A314F9EA;
	Sat,  1 Jun 2024 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="m5aCDMt9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AE11C6AF;
	Sat,  1 Jun 2024 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717244137; cv=none; b=ijN1Tb5DN5WC1b6LT7G+SKbD72auP9ymhYfWC4yGwEF/toR2ZVNHB1URCdq/5lKWIU/2B8kxDlq3ttODM4J0MqRJU+Fl1RTn2GBz3l2L4WnzVzV4Orzo8GLDYh045MxbUhel3Po0IzmN6b2COqw4OwhoAelbTYFOOIw/vrc00wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717244137; c=relaxed/simple;
	bh=lvEcECdSPEZ9gHThU+ok/dFIWZz6KwxLY9jrZJous+A=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=qinnWlpNhkYTPqduaE6VlTYSYTr3GAt6PYUi7l+GixbF7FfYLNiy3pMngtIVnSu/5QAVuihxog12uh0C5i0AbnWuyodO/jmc7Ht8KlzjcMNKLTUSHVA674mya/oiZqPCB/V645/TFiQRBaG8qHzG8Ov1fiTz4o56v+NI0agaDTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=m5aCDMt9; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1717244099; x=1717848899; i=frank-w@public-files.de;
	bh=lvEcECdSPEZ9gHThU+ok/dFIWZz6KwxLY9jrZJous+A=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=m5aCDMt9HIKbzsoH185M2Yfo7fwJNHtvlNHVa/bMzbqeyUwAcCDoHKWMO6dsDI53
	 MJbr0KmSgP3NQLBPJk18KbHxWuxalptJOh6Su/R6adC7cbXf5IhdBhmmPyONNqaxH
	 ztqZgY7HfIsjPIlaLguwHbK5V9XyX675I19rtAOFx9aECAsjm1dFdzHLBRjj52Vtb
	 0iHGfvdBdhOtHgMtAZqlIfawXd1Ez01bZMj4GAgNoZzSWhllstz7dzSIyldJ2JWrc
	 T30oa9v9lynbC+TAPfqxkoPDtTpWCCyFMrNRfKxaiIhqQAj32xggKks1z11AI9YJD
	 K0mxsWQEAWSjr2+0gQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.147.29] ([217.61.147.29]) by web-mail.gmx.net
 (3c-app-gmx-bap08.server.lan [172.19.172.78]) (via HTTP); Sat, 1 Jun 2024
 14:14:59 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-afd8a6d5-1acc-4020-b8cb-e0db80c241cf-1717244099767@3c-app-gmx-bap08>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Eric
 Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>
Subject: Aw: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi
 R3 Mini
Content-Type: text/plain; charset=UTF-8
Date: Sat, 1 Jun 2024 14:14:59 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <a7a20d35-f566-4c3c-aef1-cb7a0f349cf6@collabora.com>
References: <20240510095707.6895-1-linux@fw-web.de>
 <20240510095707.6895-2-linux@fw-web.de>
 <a7a20d35-f566-4c3c-aef1-cb7a0f349cf6@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:csPF87R4ollgagNDdL+HT/01eQEv27Y1G6e/ybL/hqAjMvhTTSL19a/hYOa0N91ckFy1u
 m/eYtsKP20+o0LNLtViebe5BzFkkpLthFMc+cWYLiaBRUO1wRywenLslwMPzj1BwkeqJn3nB5VBp
 lAtk6lfKrjvW2V/6XLYH2iHIkdf15CgqJBnHcp2ZHZZ2k3S8N31M0GFv6rHVcEjV/jEJ/0f0zHJ/
 ylN01GfwjzQMSbeVeXs5M5yoGXANlVLm4tlzXIbhg0HhNTT/qvTNliIkyUBnodU+MrfLKyGHHZ1f
 tQ=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9m4bUWM75tM=;ugYFxEsX+a5lkO2Zcqo7G7+zfjz
 KgZNAsN3DTuYK3PROs1445uXbDRwkbcD66MED97R3+O7hjCWpSwSoPsmzCTTDv0zBMbQGXh2J
 Rh3PIAzlinoT4BgrR+nFDOOAaMTiN7oaPXSJXEWcWKFQDc24BT3nmEYf8oVtr2X4exqH7rTNX
 /kHtKuu7s/WsjsgwgIM2zi87Q5PZPFiEEI0iGdUcKf7g7z2MZiY7UvKywVB9BZrIEJKtIuqe0
 HP3udYRs2G2f5j61t4hLnjGgstPa6W8AArZtYzQor43jJAr3TcCU4JLw0jpa5vqpRQMWrReXn
 XJUk8DWSA6dWWcZ65b9rFPFW7k787d/7E6BIBdxAp8uKEH2Owb3L3Wd/N4g0Un2A0YDVQFzih
 l0BqF85t6MQsTdyPsh+vApyipjIjyyzkd333sRukslARpXzpMtOkSlWbGIYmgopu5HYZcJYu9
 Dmqkphtrrd29iysn9D/nbBybeVFGxO8Lc2vYWFOgH4shL9PDOw8+N1IpyllqnV1NN3XFqUYqp
 YTeYPHrDeJPr20/JJJmADXkdn3nnppFBwyf9mB3TuHOpU0/QDjHp0g9a2SJ9ZYl2e7xhtvwLn
 EaBKXkNJRLJgcZ4oMGhyRzYs3qbSAe3Tls/AHhD4GQ+DZIVN9lIYsgAf+tuao1ojvoW3IDUQT
 t10Sk5GHXuxiqRbXRBpxVgQaf8UXonCoskxpzxyb9wcLt+SwzryX27Qw4ajCX0E=
Content-Transfer-Encoding: quoted-printable

Hi

just a gentle ping...is there anything missing?

i see state in netdev-patchwork [1] is "changes requested", but comments d=
o not say anything about this...

in mtk-patchwork [2] it is new and i do not see patches in mtk-next [3] ye=
t

regards Frank

[1] https://patchwork.kernel.org/project/netdevbpf/list/?series=3D852204&s=
tate=3D%2A&archive=3Dboth
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/202405100957=
07.6895-2-linux@fw-web.de/
[1] https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git

> Gesendet: Montag, 13. Mai 2024 um 15:06 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> An: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.org=
>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Doole=
y" <conor+dt@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "=
Stephen Boyd" <sboyd@kernel.org>, "Pavel Machek" <pavel@ucw.cz>, "Lee Jone=
s" <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Eric Dumaze=
t" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni=
" <pabeni@redhat.com>, "Matthias Brugger" <matthias.bgg@gmail.com>
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Eric Woudstra" <ericw=
ouds@gmail.com>, "Tianling Shen" <cnsztl@immortalwrt.org>, devicetree@vger=
.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linu=
x-leds@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.inf=
radead.org, linux-mediatek@lists.infradead.org, "Conor Dooley" <conor.dool=
ey@microchip.com>
> Betreff: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add BananaPi R=
3 Mini
>
> Il 10/05/24 11:57, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add MT7988A based BananaPi R3 Mini.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
>
>
>

