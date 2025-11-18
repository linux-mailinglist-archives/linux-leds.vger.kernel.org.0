Return-Path: <linux-leds+bounces-6193-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E03D0C6BF0B
	for <lists+linux-leds@lfdr.de>; Wed, 19 Nov 2025 00:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E32424E1F29
	for <lists+linux-leds@lfdr.de>; Tue, 18 Nov 2025 23:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31FE30BBA6;
	Tue, 18 Nov 2025 23:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UfvYck1u"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650D2D5951
	for <linux-leds@vger.kernel.org>; Tue, 18 Nov 2025 23:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763507200; cv=none; b=VJvyuulR8t3mIn/4gs9JOHX8opflk4OioDgP60nz9A/UVYp76xqqdTXJtcQlTESLmsYoG8vSXFbcX5/6jHU9gf0FOOjesDaxjKtKRCSHix+TgaVjRdGQ3HvJkWqGW9jAN/U0VuafHZIYfkh9gnFUzQuzD0GOZRnIXMvquQWf1gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763507200; c=relaxed/simple;
	bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jY6Iv/hs+Vxhs4N08VEmBrr9xXcNUOMVfen0RcE8aZmnc1ZwelwBbkMQ8KSXDg6grXcwj5xwjbjX5wGOt5M3WzxiHhuaESoY6RT223rKvwVjMRkjaaupNobt7ykZ32sbsCO5+nw1LTelI3rJTbErzpw5EktBdU8Sq82CHWY9/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UfvYck1u; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5959187c5a9so2109146e87.1
        for <linux-leds@vger.kernel.org>; Tue, 18 Nov 2025 15:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763507197; x=1764111997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
        b=UfvYck1uNz8mqIo13JFGwzFX9VIkjKIEo9RmRV4QPX5MnAX+9ywoIUDmVoPkCRVIiG
         3fxyN53ckBdXcvwPWw89T7UAoRuOIys+10yKO3sA++4R44slzYgRUir+QbRn2769mnk4
         UnUwnfec1xgR4Xn6p22g6kaT7AUAac4rXo6Lmu/xf/BLJjfEXH5eFSFC9uHxVF9+UTu/
         HGU5ktezAOQtZ36HJxwuWEjhQul4Gcn10kzddMrXMmazzT9msgcv/l0C71FGD5mXbrDK
         x9lKdHGi+prGGXgWm8LMMM/Td90mu1ZLW+L7bVuf4z9Kl5kYjL1Q39LHBi+TKA/57TK+
         TdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763507197; x=1764111997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=njsPLW5+sRAcBfyQAXjbkM6oMwgJ0E/jrmQ49WJzmtY=;
        b=cfNR5bRYT5vd5D5HAJrBTkS9RWQka5dvNPWYyB79W9meZjPVhM8clpRhfmn4fLCj7l
         hMJUF1/I4Oc/8Eyw53LPecHg2MtrBJ7P/hWdtOmtBycYh2JcSGIay6M0dZnKmyeFxgsw
         CH+ZriFKorqUDpr4g/xIT/As2hm2eGLfSe10As97PFeTYWjRcVOICuqAZtNMIWZt2CrS
         Osq/yJCxyEcJOYrjk9iwRG636bebwHWSmxwIX9QPZngq1zvgCr6YspgTJJ0jqUW+aOvp
         z6lk/Oj14vUhH5q9MdP10wvFuMERhyPM0ge1oJo364i+EvSc67IxnZneXkJanQXWYX3z
         ec6Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2ntvUnHlqT85/tJWtrVZg6cqbyIqKzLexx+hNJTdLFZTVeTSrVEd1S24+6+DCR2m6Usbwcpng/chj@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2y8++W3ArHYT3fEOd162Mjca5aNHuyPTpCegZT/JlL64YRm1z
	+CtIzKXW6T22bIjigrY+fU1SiY+ax7vJrkHh0uLvT60GjW3z+LpVfvNEyKDtfPVZe7tXRXFi2CL
	iFhxDlHSEn7v9HE43BPL92l2o5fmijwUAIeJ/friF6w==
X-Gm-Gg: ASbGncv1OztyhXbHTbRrceM+PA/RmYwx3u/NwioabxieF0Vvm39O8oLZ+vQTxJ1JVRL
	JzoHBcrro4zFkshvE/GRA7g1v/MYDCVsCag+FuIvldAOk6LjPl7A3WRLAtEMHxTpiLI245tP30C
	Ss8H9vxD9ykIlqb1AwNkaWWuEeQtoJILlBfOKLQDfit+8V91b/yBfpJ6SSp2wSflck0BDvuHlQJ
	GQG/ului/IJtv2pFgeYfRAJzBQD3PDJPeIfW4XV7KYdQC+izZ7j7RAOYIpKHAaXuXR7+X+hTdjr
	5E2a8g==
X-Google-Smtp-Source: AGHT+IHgvWgHNR1n7HikNfbECM3QMJGErQNkGV7PI3jzhreQtbR/8j6SX6DzkJAmHt+W6Slk62x/gQ3zMskh1FFfiGU=
X-Received: by 2002:ac2:4c4b:0:b0:592:fe0f:d9e with SMTP id
 2adb3069b0e04-5958419866amr5810310e87.7.1763507196990; Tue, 18 Nov 2025
 15:06:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763022807.git.mazziesaccount@gmail.com> <ec2cb44d9d00f5edaed2fbe17fd9ddbed914ff37.1763022807.git.mazziesaccount@gmail.com>
In-Reply-To: <ec2cb44d9d00f5edaed2fbe17fd9ddbed914ff37.1763022807.git.mazziesaccount@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 00:06:25 +0100
X-Gm-Features: AWmQ_bnx0kL6TQjG1WBAuJJp0XRB0JYUZxqe_CZgABTVpH_anNv9ed5mp--DLwo
Message-ID: <CACRpkdaa_DuXbLYqOV3aOSGywz1wSPc3-7SN8FtwTdVza6-omg@mail.gmail.com>
Subject: Re: [PATCH v4 05/16] dt-bindings: mfd: ROHM BD72720
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-rtc@vger.kernel.org, Andreas Kemnade <andreas@kemnade.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 9:52=E2=80=AFAM Matti Vaittinen
<matti.vaittinen@linux.dev> wrote:

> From: Matti Vaittinen <mazziesaccount@gmail.com>
>
> The ROHM BD72720 is a power management IC integrating regulators, GPIOs,
> charger, LEDs, RTC and a clock gate.
>
> Add dt-binding doc for ROHM BD72720.
>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>

This is looking good!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

