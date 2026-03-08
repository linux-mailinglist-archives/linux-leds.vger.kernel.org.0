Return-Path: <linux-leds+bounces-7158-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NLDLI8IrmkN/AEAu9opvQ
	(envelope-from <linux-leds+bounces-7158-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 00:38:55 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58109232BF1
	for <lists+linux-leds@lfdr.de>; Mon, 09 Mar 2026 00:38:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E925D30467C5
	for <lists+linux-leds@lfdr.de>; Sun,  8 Mar 2026 23:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BA235CBDD;
	Sun,  8 Mar 2026 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXuqJk0U"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923783537CA
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013035; cv=none; b=pmgQc+QYy+Xy68R6O6VhdUlK884YFPUGD3P4U3VrQdbIYyGjw5khODuuHGDQ9IevcEUNrWqrr4L6gZfy0MWnnooWndw/DkGlFYEC1ETkCasmTcWqWrLEJptSmiyDjuwpuZ0FS1Tm2MKHx6WaNlUmPExyvXODSi3E8kWtjHw+Puw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013035; c=relaxed/simple;
	bh=Y1OEgdq6oxx/yUdJofc5WjQU71h2hY0jeep/Kt+ouww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CPJVlU9QidceQDkwRefs9NVZ+yAxIV/kughc5l1NX0FTjqcRrd8UEIeohYPSmHe7Z8c4L82cTDvDkKTNtEsJt9c0D0TDqW+TNFc2aHeit7VWwp8Db26LW1lCUda6Pj3HjUAKgj13XwBl5DyPtYfWbXH/UsFz0hYWBx1/OgxyCAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXuqJk0U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D7AC2BCB0
	for <linux-leds@vger.kernel.org>; Sun,  8 Mar 2026 23:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773013035;
	bh=Y1OEgdq6oxx/yUdJofc5WjQU71h2hY0jeep/Kt+ouww=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sXuqJk0UxkQ2fLoIcTQQYBKIZzzKxVvHeMtgKMUMTXQE9J2gxM3e6dFKeNsyFUEWf
	 XkH9+xiMRoWFLhiIGZmRRQQZbBNla5oB2EHotVb3CvpB1Rx7PFCyPJJ+Llhp8sEc+w
	 mrlOcfMMN4UjemD/0YG06TEW02auA/gVCJqz9OgxR0dg5pLcY9Dg6o3HtHKTqvtg/a
	 uxwyR/zvMGfGIbLVmxoJy9k0cIBKDypXjUj5RQLVIulM/7E7RF3aikCaPVJ5zaKbwx
	 G61hjS/k6+fDAVaHjuiX6I1Vr2EahN4+jcfvMOaMTwYIZN/2wB0UEaZYda2xte00Mz
	 MnBF4/xA5BNcQ==
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64ae222d978so10581311d50.1
        for <linux-leds@vger.kernel.org>; Sun, 08 Mar 2026 16:37:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXapV9zTpFvn4HXqhboPh2oxa+bGQ0NmBhrOI2TU0g20EQ8DKWsGV/38LUDV/VzhSus/m40pO/6BcdR@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4EcL5NYTBUws2o61lwxsNg82CLIHhj/qmTJjFYy6Ipdv1Bp9E
	QZjf3JmgS7ZmxVVvEeRvlE2g3QdB5xsx4vjr5/3GDxO4oIn0jnHZkoO2v470ok1rvsWJbBPpS8P
	+Vs+P8l/UA4vcg+rdw7fUwB6+LzNRN1s=
X-Received: by 2002:a53:b44f:0:b0:64a:cf8e:47f6 with SMTP id
 956f58d0204a3-64d14350c6amr6887787d50.68.1773013034641; Sun, 08 Mar 2026
 16:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306-expressatt_camera_flash-v1-0-b1996f7cdfdd@gmail.com> <20260306-expressatt_camera_flash-v1-3-b1996f7cdfdd@gmail.com>
In-Reply-To: <20260306-expressatt_camera_flash-v1-3-b1996f7cdfdd@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:37:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLkbDAx3x4jRy5DjWmZHVJ_DwHEBSBbOOPB34P6WtmAS=A@mail.gmail.com>
X-Gm-Features: AaiRm53H04DqIiqJZMOp22bNjrTYCtVSyTSkQUP-gMpoGaKl6snzd2vAfDw672Q
Message-ID: <CAD++jLkbDAx3x4jRy5DjWmZHVJ_DwHEBSBbOOPB34P6WtmAS=A@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8960: expressatt: Add camera flash
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 58109232BF1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7158-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.939];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Rudraksha,

thanks for your patch!

On Sat, Mar 7, 2026 at 1:58=E2=80=AFAM Rudraksha Gupta via B4 Relay
<devnull+guptarud.gmail.com@kernel.org> wrote:

> From: Rudraksha Gupta <guptarud@gmail.com>
>
> Add camera flash support for the Samsung Galaxy Express (expressatt).
>
> The flash IC uses a one-wire pulse-count protocol on GPIO 3, gated by
> PMIC MPP 4 which must be driven high to unlock the flash circuit.
>
> Downstream references:
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/=
cm-12.0-YNG4N/drivers/leds/Makefile#L51
> Link: https://github.com/LineageOS/android_kernel_samsung_d2/blob/stable/=
cm-12.0-YNG4N/arch/arm/mach-msm/board-apexq-camera.c#L591
>
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>

(...)

> +       camera_flash: led-controller {
> +               compatible =3D "richtek,rt8515";
> +               enf-gpios =3D <&tlmm 3 GPIO_ACTIVE_HIGH>;

I think you should ideally define richtek,rfs-ohms, if it's impossible
to find this information then use the default,
richtek,rfs-ohms =3D <16000>;

> +               unlock-gpios =3D <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;

As mentioned I don't think this is right. The chip has no "unlock"
signal. I think this is a simple regulator (such as a switch).

I would do:

vin-supply =3D <&flash_gpio_reg>;

Then something like (better if you reserarch it a bit):

flash_gpio_reg: regulator-gpio-ldo-3v3 {
    compatible =3D "regulator-fixed";
    /* Supplied in turn by VBAT? I guess so. It is between 2.8 and 5V */
    regulator-name =3D "FLASH_3V3"; // Or whatever the rail is best called?
    regulator-min-microvolt =3D <3300000>; // If you have better guesses, u=
se them
    regulator-max-microvolt =3D <3300000>; // If you know VBAT then use
that voltage
    gpio =3D <&pm8921_mpps 4 GPIO_ACTIVE_HIGH>;
    startup-delay-us =3D <5000>; // FIXME
    enable-active-high;
    pinctrl-names =3D "default";
    pinctrl-0 =3D <&flash_led_unlock>;
};

Notice:

+&pm8921_mpps {
+       flash_led_unlock: flash-led-unlock-state {
+               pins =3D "mpp4";
+               function =3D "digital";
+               output-low;
+               power-source =3D <PM8921_GPIO_S4>;
+       };

This seems completely unused in the current patch, but my addition
above uses it.

Yours,
Linus Walleij

