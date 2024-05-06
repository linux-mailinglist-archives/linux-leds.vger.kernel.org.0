Return-Path: <linux-leds+bounces-1611-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D686A8BD2FF
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 18:41:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12585B21B8C
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 16:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02168157488;
	Mon,  6 May 2024 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="t6hJqNY+"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5991156F38;
	Mon,  6 May 2024 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715013639; cv=none; b=hZ74AwNZGXVUfG7YRHoOH7etpMiS5NPPbyZr6BAOdr+AA++OdUnh6pfcm2r1+mJQhvrRe2xRNZhJvQYipSS9w9T1aMbKh7Tgc9amZuwIj+LvwCOgPggwPcZfFWhXzCbvVsAAJ3lvkz4YkPsudPYrGxWZ8bDQAGTrXrgGDYjDRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715013639; c=relaxed/simple;
	bh=UoWcNP9kwzro3u5AXtDZDkiZxrJZfG6cM+wLlIflkXU=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=WRR1Ni2mD/Z8fIJNR/rsUZkbfFQXwvccN/YUPKwYDRl2atyeubIdNbrQ7Zg+96FMJrs0cG4dAqeZOqc+HbSNn95kQWQ/Q/YSWBuPF6EuWajwhkgGzReDiDEyWVorN9L9JdUKcZPBxuNvocTEr3KXVsPCdj0Vx6wYmdBlNnGwwlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=t6hJqNY+; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715013613; x=1715618413; i=frank-w@public-files.de;
	bh=N/q68vb1HhT4JSLgDcC9dSoHLwhoZYQX/ai2pcy/liw=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=t6hJqNY+EegHoajk9Pc+0pWAlS4Yd+wbC9xc5foY7mtoj5E+fzQVfHHijIB3uE04
	 5VyK4YgptBC7x7st6WEqdeX2qPsC+J86rnyWLBBN77iVXPT2s1X1TV3YKTbtq9ZFu
	 epowDLQMSQo4r72jPe/EbZxBWKTISd4SseBQQsNjoMXYY+XdadrzOqJEBK9qL3amQ
	 TU98n6PEsJ3AjGOpG4tvnJiS2lGqC0p6VbbSZIU7cWb70rENueYpkQsYmvgDu/Kd/
	 TM4lhtWwmgO9Afx87wRcFU/49sjq60Xe5rvbG9pQBe2GX920Hbpu5+eyjQnCDPFp/
	 IOX6KGGVXeLBpBluiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.77.247] ([80.245.77.247]) by web-mail.gmx.net
 (3c-app-gmx-bap23.server.lan [172.19.172.93]) (via HTTP); Mon, 6 May 2024
 18:40:13 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-0d9eb74a-bce9-48cb-b119-e75a41404ed5-1715013613002@3c-app-gmx-bap23>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Eric
 Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
Subject: Aw: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based
 Bananapi R3 Mini
Content-Type: text/plain; charset=UTF-8
Date: Mon, 6 May 2024 18:40:13 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <174a8bfe-7a9e-4816-9bde-de48f04b07f6@linaro.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
 <174a8bfe-7a9e-4816-9bde-de48f04b07f6@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2Nu5/Rcmkcng/UFjyKhDHjpn72TCN/RAt4hU+RXwahNi4GUC7U3bepBAbLf1/WtG/b/mc
 t6MPfrxxMJsTe4yPWQxfhski+CBd2KW4LQeby40cGG+V+QIV8lqQ0xS7yYsAEz+CMmQa13jGQFhi
 2944XqxVKJOLH0oXg0nwGY63i78FubKggNYWioQX+V3voIYs9DzcS5cILQkCHW8bYHOX7/JDsvmP
 LhJHTfMbERqZQ6bTLsKnRFQ4gq4iUsl3GG50s3H5NWtVDPooARWP/BGSP0wWwvNz45q74h5vUIDn
 70=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NAsoPtlBBgM=;BO2DCb+S9ohdLnwa8Hpcq1GUEPe
 ilz3XZSkDGWrCrCKCACKqkcaiUa3wfr8CjuUbPiYkzg97H6S4+RqA8LaV2FcKRZ3uds0NXycD
 D9EnmfoBshiYg8IK1Q5RFLrBgSIZA6WSsVjxYvJ6VGYgMyL7RRTWG/Ewjbn4PayddcyzPNSWi
 Mp/XSio46j41O9XFKrWnLoRlH2rpubf/IwWyVxktBG6cVo5c2i+Vkfi5ZmoxqF9+ofnUulvps
 bTfOfofFnd5C/BG12if5dmY0t9s2oeXXLrVa+y5Z3p9uI7dlsEiDdQUJ0I8dRjrUDi0VvqnX5
 VNaplCpHWOUSndjDdf/QeGXpy33ZrxpCFttFsoLR82hwhA96N13p3PYm1VX2clM+8tXNVqFE0
 M/+I6QlD2ryJDVK5jJW/0CP7TcaRZoPEeF25ogGpKe2QDBBhAQ5lz3K05MiirheaJ3fHeDMYZ
 7yMvt14o54Ba+QMSyyEhYt+bFEwWcMfGQYBRjpyGMdhJftxyN2wDl5b2saxrRPyG25RGYJFWm
 Ht02j5lFtl1vnaKMw3ZwPhxlctR8D8ozfzOy7+eNlJUGIiwvfH5f71qXh06eFUizFtOH7iupA
 S4wk1ufIzGfDUUeNnwe0Oc88WqigKDg1NWm/qZfQElsHx9DcnpRQ646moiYPapqjEch033K7r
 1Bn6ZkKsiHXPRHA26QIGBBqFUf2YeD/iHIN4lrmoZakXmhLGIFeEi4VSr3EweFY=
Content-Transfer-Encoding: quoted-printable

Hi

Thanks for review



> Gesendet: Montag, 06. Mai 2024 um 10:20 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> An: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.org=
>, "Krzysztof Kozlowski"
> > +	dcin: regulator-12vd {
>
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]+v[0-9]+'
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/co=
mmit/?id=3Db6d4b3500d57370f5b3abf0701c9166b384db976
>
> > +		compatible =3D "regulator-fixed";
> > +		regulator-name =3D "12vd";
> > +		regulator-min-microvolt =3D <12000000>;
> > +		regulator-max-microvolt =3D <12000000>;
> > +		regulator-boot-on;
> > +		regulator-always-on;
> > +	};
> > +
> > +	fan: pwm-fan {
> > +		compatible =3D "pwm-fan";
> > +		#cooling-cells =3D <2>;
> > +		/* cooling level (0, 1, 2) - pwm inverted */
> > +		cooling-levels =3D <255 96 0>;
> > +		pwms =3D <&pwm 0 10000>;
> > +		status =3D "okay";
>
> Why? Where is it disabled?

you're right, i'll drop it

> > +	};
> > +
> > +	reg_1p8v: regulator-1p8v {
>
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]+v[0-9]+'
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/co=
mmit/?id=3Db6d4b3500d57370f5b3abf0701c9166b384db976
>
> In other places as well.

ok i change it like this (label doesn't matter, right?):

dcin: regulator-12v {
reg_1p8v: regulator-1v8 {
reg_3p3v: regulator-3v3 {
usb_vbus: regulator-5v {


> Best regards,
> Krzysztof

regards Frank

