Return-Path: <linux-leds+bounces-624-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D91AC8325F2
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jan 2024 09:48:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7B31B1F23519
	for <lists+linux-leds@lfdr.de>; Fri, 19 Jan 2024 08:48:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0563C1E862;
	Fri, 19 Jan 2024 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZlGhTDsA"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835898F6E
	for <linux-leds@vger.kernel.org>; Fri, 19 Jan 2024 08:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705654101; cv=none; b=FKm0cncJ0JssvKjKpk2lgtBy3dsRONFxtpuHAQcrC5qy16aurvNkGJXC6cAwrvHYl03MQO5C31Xox8c7hE2nMMBo0OvU8EjNA3/f/twTab92G8b0XQAxBjiA8n5HUNEoxIjLeoXNnlCyQiGLa1LbjJ0+2SEdGkwtXQcNLXLMcEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705654101; c=relaxed/simple;
	bh=jfhDYLG1dvsUdgbiJSB+en/Ncg1jyK/q0ET+NJJxBo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3d788TAuVoFe1EphGN7/+5UqQ1B1vtormXI9fwvOL+VrqUInnjnBt3x8s1wddTqD09xS6FJH8ZUlayGtAE5/UPv3fzm6ehHMmOiuoTNf+gzg9tIbg7qsGoO8pYIKvdtvV2HZs/w8j7UrEktOX1FrZAESBdXPogEVKpXnmlcKLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZlGhTDsA; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc24f395c84so457376276.1
        for <linux-leds@vger.kernel.org>; Fri, 19 Jan 2024 00:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705654099; x=1706258899; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhDXGzyPXV715cy+WNtJqPuL0E1aYaWoiHU1aAEw5Sw=;
        b=ZlGhTDsAtQyGA1QXYktDzVppnBOAmXOhr5p7NWt/Ap6RzGABo8JnrODMZfEzCUzA2M
         acOL3JfizQuDwDS/u4vSmKeczyPmQ1FM4VpJxdEH9Ai3ivPW+lf6RH5KIihrJIQp2m3D
         E+Op6daQTVA5yUZ2GtDsjacv1nTKYkAigVXkeq/ZiHx6F8NQm/xDnL9zx7oRSBBi1jN7
         X8m+K+Y3jVhhbFCylQVhfr6OP2zQT8gNKDCKaHLRsp7wi9Zpm9U6yED1SiK1hbCHoXPW
         XPxf+twA326KHq4plX0I3LhwXpwmDTnnNAZnJQBGFO/xmjHM9KHKetE8NtqTh/6v0+2c
         M2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705654099; x=1706258899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhDXGzyPXV715cy+WNtJqPuL0E1aYaWoiHU1aAEw5Sw=;
        b=q/+ZvtIAkGXTpKaqIVfM6S6YQii7HX8JrNDhDl4qtNC1kyFf+7ZtVvCIJj70Ddnrno
         yWxnMtphayLRZKQIbuYNmGg+iboAvJIvvIIUC5KS0YLpa1BmQdCFDjh022cOmuVw+Kkh
         /pG7dGpRO/h3eIRsdum3agKkVYPxJ2Ke0YGfrNQzzoPy2sMLnC/o5itqdh//Zat1DinN
         WZdPxB2KPMBuz1bYD+LxlmtVzLbJ3+I12AKRw1V6TKBq7LAQCWLxw6f52nfJTHLPikqj
         Q6Z2A4YaFVMWa43T+pyKPpl+WUpYEiu9y95x3TajBh5b/uxmPNQN7AYdJfEUhSlkxrTg
         d81A==
X-Gm-Message-State: AOJu0YyEMUSuzO6ICi6ldt4K7X0k/kXMH3h6ixHIkzzEArhWojDvfUsx
	GJK9338+fpOTvs50rrXKQf9Pay9HYWEk14RbHlvnMVMXAFoaXc9XP6Oms0Cps8dZehg8Ptd/30X
	s/nn43Y2no+dRWR24KsLJdUuiBD0G74Kdfs25zA==
X-Google-Smtp-Source: AGHT+IF88cG+WncmwGCjZW5ji71ZZSYIYdW1UlFjUZvVHBfh93nZW6jzoVh6/wt8z+AYZ5sFNPleDu0D+2abT8Xvrkc=
X-Received: by 2002:a25:9bc7:0:b0:dc2:3a0d:23c1 with SMTP id
 w7-20020a259bc7000000b00dc23a0d23c1mr326772ybo.49.1705654099618; Fri, 19 Jan
 2024 00:48:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118-ktd2801-v2-0-425cf32e0769@skole.hr> <20240118-ktd2801-v2-1-425cf32e0769@skole.hr>
In-Reply-To: <20240118-ktd2801-v2-1-425cf32e0769@skole.hr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 19 Jan 2024 09:48:08 +0100
Message-ID: <CACRpkdY72JLKTC=1agqHFzOPaTwBe2Y-OfCkeUUYGz13J-5r=Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: add Kinetic KTD2801 binding
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Helge Deller <deller@gmx.de>, Karel Balej <balejk@matfyz.cz>, ~postmarketos/upstreaming@lists.sr.ht, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Duje,

thanks for your patch!

On Thu, Jan 18, 2024 at 6:33=E2=80=AFPM Duje Mihanovi=C4=87 <duje.mihanovic=
@skole.hr> wrote:

> Add the dt binding for the Kinetic KTD2801 backlight driver.

Maybe add some commit message?

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Duje Mihanovi=C4=87 <duje.mihanovic@skole.hr>
(...)
> +  ctrl-gpios:
> +    maxItems: 1

First I thought this was inconsistent with ktd253, then
I looked at the datasheets and they really did change "en" to "ctrl" so
this needs a new name indeed.

With commit message added:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

