Return-Path: <linux-leds+bounces-4918-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A418AECA55
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 23:06:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93B983BEDBC
	for <lists+linux-leds@lfdr.de>; Sat, 28 Jun 2025 21:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4699C221FAE;
	Sat, 28 Jun 2025 21:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZjFc4v4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AAC184F;
	Sat, 28 Jun 2025 21:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751144776; cv=none; b=qpJzGKGys+MQNwh6U+eHJPfPn54IYN1+hpVc1lRAyn1r/fM2HMpydS9iw2kDNMlH5Fad7F1ZtmTzWL4ToIZQ7rGw9aK3lfN4JgjNkw/A+/uDnnbUFf2v6ya9+1m6HLTkFeRU0DQfXp2OX1QTN1m5xQaiCurtsDt9Hqp6foYwL64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751144776; c=relaxed/simple;
	bh=7boEXolkbClomsKZeHkMqS8supeYiTS83LrnJtXxq6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uW5jhwpfKCg9f97s8Wzdb7zCFUWVdXXK3x96uea4VWCzjTyf/RUau6Wm1UCn8FQJuvDKc0awwf++vukPe4PiW+C/9EKiy04o+AYakpllmLrbYD21lvdCgxjK8UstWGeo/YYph2IscMLqWjv821hNTZAIztyip1uXUeuZ7qXoFbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZjFc4v4; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0df6f5758so156669966b.0;
        Sat, 28 Jun 2025 14:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751144773; x=1751749573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12Sud5wiEMfbfSmkQ2D2+G75AJXdzlA9FkwEtpF29jg=;
        b=AZjFc4v4jWF/5aR9RvQNT98Ow0pFZrftqetYlYOfLIMCjdU0zsKccuotBUA4YnI8G9
         2GSYcTqILrrYAAmgDA+Qstwl6LkyFUgYZYi/pfcuvNvRU0nT9mJLxXBzc2M6EJ6gbm7A
         mYifncurmAI5S4qhJUZivtKOSbDquE2VVbl53AE3+zWjz4eOfC45W1enRX4mxSntV6lo
         wQa0oRZzu241vF7ZZS0ZBZ7DYp93CbinSMnvRTaqGc6+IEMf3N4BsG9ML8DZmjLdgckK
         pFZGcyOxYlsGuq50TRVEYBOHz93y3gIBTCHaSFNviYnPr/61L0FI+BVkGhBD2MiEMAVm
         aAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751144773; x=1751749573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12Sud5wiEMfbfSmkQ2D2+G75AJXdzlA9FkwEtpF29jg=;
        b=pMJeo2fgZ3SiqL1Yy12wa1I469hcP6lDXlE4lQSmqB4uVNSletvm7/m2kbinmfZP+R
         F4sB4UBq3FYRXjCh1iaarmzq9x7Rn3aUlC/Y0056zfodb7uqxa4e0v2pSh4NdcvN8vUj
         Uwziwji2u/MsLXV4cflURnTgy0KOAPJhMPQuh0jQkQr6nzBJVHXvYv+eU2YZJvrGYEmx
         Zw4LAE1Plw28EFpmxYgZa/8SUab8MrWJZjCh2SBHuG+iXhYOCysCK4yoHi7BIBTpFMwj
         r3d3U0CfnehnRhBPX5hJhxS8B4xvoW3ZF6xRoW7Z5UtsCgwPu0aonu9jG+H4x0amktx8
         NT9g==
X-Forwarded-Encrypted: i=1; AJvYcCUBlPXISVprNQEKLPFMJ2KCCuxNls4D8K3Q88EICLhNI7wy6LvLxq8zRtnHjROuXOpCpurvh3An7w2dqA==@vger.kernel.org, AJvYcCXcpSRqCfoki3TaoIaV6y9eqDvkQ11wBEZfk6kxA/zp++cPRbLzFNGBd29FJpYiKfftht0R60aYwImVuHCL@vger.kernel.org, AJvYcCXoYLZH1aFrvVaAjjE/GJ/pcdmbee6lJ28CWyH+gzkKe/f3gFe9z1ql2x2SPl2LicikuSXoD2MO273Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwU6uZlTqlxAGTrp7MkJKJvs9RHNN+EgAsRgNuV68YpX2MYi0xD
	SpR5E79irr0CTmGJd+tEZSM6aZn81G06DhsMa8uiLCSoSEakonZxOl6DRA0lRxKEjbP+rc2vWbH
	ji4/FhTcUsQ/KEGc14ZPAnCEC316zE9k=
X-Gm-Gg: ASbGnct+ax5Y5shyO++UjX9tnzLDIJD/+SyqlJJLYbMbzfJHNCUSo61daOPKFqj8IlB
	yIrQCqTaqIFnut8GvOjmYDq20WOYPz2r19ccIdlnVgaTm8QN4otmpVqna/SoYqZiDNvFN1HyTkn
	5rt9O7YvoBbUyslkZiZY3CvNEunokLuOxEkMHcPCCk3Tg1PGtPmqiEVfI=
X-Google-Smtp-Source: AGHT+IFCnRUKLXBXI2ZymcFpPsIBkI1Ko2RO8IfBqPRqH1qr+mtr4ZGU+3SDy4eQPEHcuyDm75oB2EiG6K+Qqc+YtRg=
X-Received: by 2002:a17:907:7247:b0:ae0:b553:3a0d with SMTP id
 a640c23a62f3a-ae35011f817mr894464866b.48.1751144772356; Sat, 28 Jun 2025
 14:06:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628161850.38865-1-jefflessard3@gmail.com>
 <20250628161850.38865-7-jefflessard3@gmail.com> <175113330138.2294536.6016522770274673220.robh@kernel.org>
In-Reply-To: <175113330138.2294536.6016522770274673220.robh@kernel.org>
From: Jean-Francois Lessard <jefflessard3@gmail.com>
Date: Sat, 28 Jun 2025 17:06:01 -0400
X-Gm-Features: Ac12FXyTfui5P6eZOR3EukH-_EqAPsiawqgY5p64hyKlLrMInWx778tfg3tFG38
Message-ID: <CADsqogCLjN1YQ_G+KXAkauoSdFiH+OLyh5UVAvT261sD2LO0Ng@mail.gmail.com>
Subject: Re: [PATCH 6/8] dt-bindings: auxdisplay: add Titan Micro Electronics TM16XX
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Boris Gjenero <boris.gjenero@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, linux-leds@vger.kernel.org, 
	Christian Hewitt <christianshewitt@gmail.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Paolo Sabatino <paolo.sabatino@gmail.com>, devicetree@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 28, 2025 at 1:55=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Sat, 28 Jun 2025 12:18:43 -0400, Jean-Fran=C3=A7ois Lessard wrote:
> > Add documentation for TM16XX and compatible LED display controllers.
> >
> > This patch is inspired by previous work from Andreas F=C3=A4rber and He=
iner Kallweit.
> >
> > Co-developed-by: Andreas F=C3=A4rber <afaerber@suse.de>
> > Co-developed-by: Heiner Kallweit <hkallweit1@gmail.com>
> > Signed-off-by: Jean-Fran=C3=A7ois Lessard <jefflessard3@gmail.com>
> > ---
> >  .../bindings/auxdisplay/tm16xx.yaml           | 153 ++++++++++++++++++
> >  1 file changed, 153 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/auxdisplay/tm16xx=
.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/auxdisplay/tm16xx.example.dts:59.29-83.=
11: ERROR (duplicate_label): /example-1/spi: Duplicate label 'display_clien=
t' on /example-1/spi and /example-0/i2c
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[2]: *** [scripts/Makefile.dtbs:131: Documentation/devicetree/binding=
s/auxdisplay/tm16xx.example.dtb] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1519: dt_bin=
ding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
>

Thank you for the dt_binding_check feedback =E2=80=93 I=E2=80=99ll prepare =
v2 shortly
fixing the duplicate label issue.

> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202506=
28161850.38865-7-jefflessard3@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>

Before I send v2, I=E2=80=99d like your guidance on one specific design que=
stion:

Currently, the binding uses a 'tm16xx,' prefix for properties
describing hardware layout (e.g. tm16xx,digits). TM16xx being the
family name for these compatible controllers (Titanmec, Fuda Hisi,
Princeton, Winrise, i-Core).

1. Is using 'tm16xx,' as a class prefix appropriate here, or should I
instead use a vendor-specific prefix (e.g. 'titanmec,') despite
multiple vendors implementing this hardware design?

2. Should 'tm16xx' also be formally added to vendor-prefixes.yaml or
handled differently?

Your advice will ensure the next revision aligns with DT conventions.

Thanks again for your review and guidance.

