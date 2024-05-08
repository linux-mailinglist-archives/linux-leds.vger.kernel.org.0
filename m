Return-Path: <linux-leds+bounces-1634-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9E8C0447
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2024 20:26:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12CB528662B
	for <lists+linux-leds@lfdr.de>; Wed,  8 May 2024 18:26:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3192C12CD8E;
	Wed,  8 May 2024 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="YWqiOAZW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ADE12BE9E;
	Wed,  8 May 2024 18:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715192770; cv=none; b=nmAAYEj8UWZZrguFZcpM0r6AIeZqIo6rjyrViv0/6f1ncsLTn2NQtMxhRLZdW+JSHSKHSVMeswrKRe5kVzNrDmGCO9mZVDt0gkBiLzg+MI9CInPGWbDzl7UUM0sfQqPbNsew9xYYEL7o0DEYSjZji0KmbIX8kQ9kCDlGfs7geEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715192770; c=relaxed/simple;
	bh=JP8VpdG+xqhGXpnZXCPTnLRTVXJ49yvvJJoskFFST1Q=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=QJRiaNUefN/s9ys4m7gsxOfJbOxn4DNj4Qy4RiiohFPnks1Z3TgrluO+jXU1eAfwZFDja+3YpLBc4N3qnZdjwT2GfOrK3pOicNWUEhOQfkOl4ka1s7VXW+ZGsoJrsxfzsk8KAZ1t17Ob4GTFgFJiPuW91CDgD02W4/vBz2OpxYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=YWqiOAZW; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715192732; x=1715797532; i=frank-w@public-files.de;
	bh=8wpwOVnWMbAEATDi6P7jxqoYe5/Zc9mCOeyjYqVImqI=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YWqiOAZWPMaeNYhFjc7Dl91wHa3AoK/8ndnZhRXkks2a7xnBfaEL9mEFdBx2ZHvj
	 JF/BZvyGwnIQMqn/egivRa0xiSszgIhV9GVlTtXZlayE/ynpiAiEMqmiCktvL0IuP
	 QsWt5iYLDWIJ6OfXkJBkBLTYIHiiW9txd4oHJC8tdiqalLyJEmVcZxLBEs3PbiorY
	 nesZV3RKHBG0l3sYb/XQ0sB0BqqPsELRfKJ1giH+40euQ6PB2ABrGD6wEYxhNfod4
	 qX4oQj6baDxpCoH5L2Ak5WdLKfvuqWmsTcW+uIO4i14Yef4QcPssu08ibZaLuec7O
	 3va0pl4li7gEnTjbJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.232] ([217.61.153.232]) by web-mail.gmx.net
 (3c-app-gmx-bs02.server.lan [172.19.170.51]) (via HTTP); Wed, 8 May 2024
 20:25:32 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-2158d675-7049-4432-b925-6ace44401aa0-1715192732273@3c-app-gmx-bs02>
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
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
Subject: Aw: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based
 Bananapi R3 Mini
Content-Type: text/plain; charset=UTF-8
Date: Wed, 8 May 2024 20:25:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
 <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
 <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
 <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:/xOfloKHQgJmPgkc9fdvkCETd9KNf9I5dIewtuJxvNKD4cUM1xpAut+kcghfLa+0aHrjb
 kbd8cMSSRy0luf9H6RS1ic2JJEi1PO8E7Dr5edqyFkNa20wM8C45JFfO8Y8qo7SIUkz8f9AIEKmO
 ixvdAAYadRvtf7kdI4G8IwXZhdrkvHMskTAkpJgRhNYwipdg1o7tMuOU+Xmo1HllZVjaMrCIm0MV
 UYIX+aSs2gQhZBVYmubf2wb4EoTzURk6Y+M/otxM51V11Oq2shRoJIrGIqB4CyocCLik6bUloCIO
 j4=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mmBOuEib9cM=;Tw4zuQm8GkQB3y9mHlDqvBj6pZx
 21YW6gdUBoTUn9pWWZZ1pRw91UVMm77D/oLRkUpmSeRXRE8322PK8anAOxv7S4R0zBYi4RSWJ
 fTFXpWp6shuJz9gxq9KuTxjCq5MSks9pt8g+UeSgRtdlgDRYDgmxdJbLfNZ3MNq6NCUkTZPxU
 zWF+dxgjiQDwk0n977Bmgnop0lI0rUC1KrAU2niFS+beo+Z7cESKsgqz4u195ShcMrmfdTtgW
 H47rdF6L3yhNBhvvWMwF0iQ5Kv+3WJixLJJV9i0kZRsaxhoq5QTJf+rwqEpuM7C2qChkLb07i
 twW0intWb6XaWKjiLvnUr7aehXKtFOguXka7AfoRauEc9RAdz5IJWbRqVjlvA8ZuK2jcPXroc
 H6fhT2rNPIneL91LAPJyEpAHVMiQ3esC2lLsAP4fngyBfDN8We+c8zWtJHUdBOncI3uPBhVzU
 aEupQ5h91DCJkhT+tm8F6XMqTQSWDtV////+OFAjJQTDCd+Xt2EVG5XvNoQoy4Ds7g8IukGuh
 YvdEuPLFbIDxt6wJkKM14BzC7gdjgO+H62Ggm72xx2owuTBllQ66/PXE2LcSp3jA1fNfq7Y47
 MxBmNg3Si9CZarNcAZYG5/+C9Ut8JsgxVLBmp7DABj9qwS9qfgITzQ3Z0Iq1PuoZkRYrY+Zql
 kNwtgPDDiy3/VKQCAQnEDqokNILxAzhb91Hykr2LfJFnKvXccMW8NBKKH8DHUqs=
Content-Transfer-Encoding: quoted-printable

Hi

> Gesendet: Dienstag, 07. Mai 2024 um 15:35 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
>
> Il 06/05/24 18:00, Frank Wunderlich ha scritto:

> >>> +	fan: pwm-fan {
> >>> +		compatible =3D "pwm-fan";
> >>> +		#cooling-cells =3D <2>;
> >>> +		/* cooling level (0, 1, 2) - pwm inverted */
> >>> +		cooling-levels =3D <255 96 0>;
> >>
> >> Did you try to actually invert the PWM?
> >>
> >> Look for PWM_POLARITY_INVERTED ;-)
> >
> > Mtk pwm driver does not support it
> >
> > https://elixir.bootlin.com/linux/latest/source/drivers/pwm/pwm-mediate=
k.c#L211
> >
>
> You're right, sorry - I confused the general purpose PWM controller with=
 the
> rather specific DISP_PWM controller (which does support polarity inversi=
on).
>
> It's good - but I'd appreciate if you can please add a comment stating t=
hat
> the PWM values are inverted in SW because the controller does *not* supp=
ort
> polarity inversion... so that next time someone looks at this will immed=
iately
> understand what's going on and why :-)

so i would change comment like this:

		/* cooling level (0, 1, 2)
		 * signal is inverted on board
		 * mtk pwm driver does not support
		 * PWM_POLARITY_INVERTED */

> >>> +		pwms =3D <&pwm 0 10000>;
> >>> +		status =3D "okay";
> >>> +	};
> >>> +
> >>> +	phy14: ethernet-phy@14 {
...
> >>> +		interrupts-extended =3D <&pio 48 IRQ_TYPE_EDGE_FALLING>;
> >>> +		reset-gpios =3D <&pio 49 GPIO_ACTIVE_LOW>;
> >>> +		reset-assert-us =3D <10000>;
> >>> +		reset-deassert-us =3D <20000>;
> >>> +		phy-mode =3D "2500base-x";
> >>> +		full-duplex;
> >>> +		pause;
> >>> +		airoha,pnswap-rx;
> >>> +
> >>> +		leds {
> >>> +			#address-cells =3D <1>;
> >>> +			#size-cells =3D <0>;
> >>> +
> >>> +			led@0 { /* en8811_a_gpio5 */
> >>> +				reg =3D <0>;
> >>> +				color =3D <LED_COLOR_ID_YELLOW>;
> >>> +				function =3D LED_FUNCTION_LAN;
> >>> +				function-enumerator =3D <1>;
> >>
> >> Why aren't you simply using a label?
> >
> > You mean the comment? I can add it of course like for regulators.
> >
>
> I mean in place of the function-enumerator... that's practically used to
> distinguish between instances, it's not too common to see it, and usuall=
y
> "label" replaces exactly that - just that, instead of a different number=
,
> it gets a different name with no (usually) meaningless numbers :-)

as far as i understand using label also makes "function" property useless,=
 after discussing
this with eric i would drop both on all 4 places by labels like these:

label =3D "yellow-lan";
label =3D "green-lan";
...

not sure if we should drop color property too...

> >>> +				default-state =3D "keep";
> >>> +				linux,default-trigger =3D "netdev";
> >>> +			};
> >>> +			led@1 { /* en8811_a_gpio4 */
> >>> +				reg =3D <1>;
> >>> +				color =3D <LED_COLOR_ID_GREEN>;
> >>> +				function =3D LED_FUNCTION_LAN;
> >>> +				function-enumerator =3D <2>;
> >>> +				default-state =3D "keep";
> >>> +				linux,default-trigger =3D "netdev";
> >>> +			};
> >>> +		};
> >>> +	};
> >>> +
> >>> +	phy15: ethernet-phy@15 {
> >>> +		reg =3D <15>;
> >>
> >> Same here.
> >>
> >> Cheers,
> >> Angelo

regards Frank

