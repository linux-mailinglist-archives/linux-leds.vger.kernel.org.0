Return-Path: <linux-leds+bounces-1320-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A046B887D3A
	for <lists+linux-leds@lfdr.de>; Sun, 24 Mar 2024 15:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 596A428156E
	for <lists+linux-leds@lfdr.de>; Sun, 24 Mar 2024 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DCF418035;
	Sun, 24 Mar 2024 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W7ENOZGf"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38FB175AD
	for <linux-leds@vger.kernel.org>; Sun, 24 Mar 2024 14:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711291739; cv=none; b=A2Q09/VUB/DsQaPwqlENyI8ZQNcLt+Y/qxmA2/jsRiCa4pWW+/sipW+HgwCAYMaSk6b9J70KWvqSstx8bs9QzghA34PRt5LAE/4gYdSxeK9LLbxmfu3xiJIa9DjUR+slOvUrSRmnL9A6JvCwjiYDmwvBkZolxesLfSShFp4OakY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711291739; c=relaxed/simple;
	bh=+hmNad4AcBKeWQma6Izd7CkEUkildK4LrIOj1dEfDRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ltVpYPN6ecODPvIX86olmjZD2kSC1EfBzsU9aFWDcotmFT2+BldjylPL4R34aAMs50esabeQzuM4h4xagLLSjDEm+3JUUVGQ/2TKxbkl4wyygeRrPmKSFAB8q7LmEl40BbVE8aALaRyVeJEmoP9v+vAWNu0Q/VNGk3/gJe6StfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W7ENOZGf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711291736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P6C7+8Wp6+2qZOsRGd4+RkqMnsrYwdbiueBVs6ZMFIQ=;
	b=W7ENOZGfYNHCzGi+ZsZ3/pK9Lu14EfBxYNvZONg+2TwpcwVucsWVPYMalhHjzY+t9L/xbt
	XSpVsjdV/xBfQTEamH4M87bBs/Y/+SDhYcxpHj4L6JoCEAfjDHzm+x8cL1u+jp4db0jdrp
	m4Svy6hlCoRQG1WO4DXyogQOQQsUBOg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-DQ4wqgpTP_yfr2fvLPkpGA-1; Sun, 24 Mar 2024 10:48:54 -0400
X-MC-Unique: DQ4wqgpTP_yfr2fvLPkpGA-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-29de4f107b7so2790524a91.2
        for <linux-leds@vger.kernel.org>; Sun, 24 Mar 2024 07:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711291734; x=1711896534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6C7+8Wp6+2qZOsRGd4+RkqMnsrYwdbiueBVs6ZMFIQ=;
        b=D+Ui1y9rpJuT+uGfN174nxa3BlWbLM0OmhinOJv7DkL8Ek/ydJDmCDEuoDXv9aWaXQ
         p05FwmarvOwG1jZ3dF5rgWIuR1h291zOLFlVSjd5sZqpPC4KG401WiwmMEpCwuzC+fsz
         iB+j+sc1yPBRq1tijRa9bVBggWq0oSwcg+DquNq5g92ip4H0RIM6K7Ak/EUTaf+Jn74u
         Gva3W2cgBNtnzpmXZ2I4aWalK4KIAHfkioTw9NBEHpmtigIi9oQppNZ/w0tTx7Nmd34j
         onA/W5pIPg4C8jPxtYQ2RU6aETs04SMG7+PDNOzatS/dR3oWPbFpszr/ML/5c0YCKL2a
         ADJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPYkNb5L3iaeo+3Q4G8RyyMoX1bf8TCpbZLWMyS8uKCjKyjjZiFf+7gSmmxS+woktPXOxVVvy8alQ8E1kp6LLRuJx3Z9FqVzzCcQ==
X-Gm-Message-State: AOJu0Yxu4vE5CnjXjodb8cdjR0KvsUDehevwRJ0a6ujK88JHGz2hWNaw
	MrasD6T5iGVKhZeKpRL/fCDIvnhHvuNw3SaFXIcZtFE78GXQ7CkZjgldNdyMYVceff46Ll4N5W1
	E1tHE9XCRZ+Msh8GWsDGAQFDqEdPpNxJUXZWBN0nhBp2G0QavhDNu5ZSpLZ7vbEV963UOTvFMEC
	clx6p5Lq+rkWLSMBPLpSVhqZQOe2E1LkziwQ==
X-Received: by 2002:a17:90b:1004:b0:29c:6000:a12b with SMTP id gm4-20020a17090b100400b0029c6000a12bmr3410703pjb.38.1711291733806;
        Sun, 24 Mar 2024 07:48:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTD1jp0nZuoHDHAd1Pk4uTsJIWjJGwFeXb0QFll1ryEavOQegPIcvGaYKN72cZx2wc/59DCc28e68iStBHLpI=
X-Received: by 2002:a17:90b:1004:b0:29c:6000:a12b with SMTP id
 gm4-20020a17090b100400b0029c6000a12bmr3410693pjb.38.1711291733484; Sun, 24
 Mar 2024 07:48:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240306025801.8814-1-hpa@redhat.com> <20240306025801.8814-3-hpa@redhat.com>
 <Ze-N_y5Tbjc93aRp@surfacebook.localdomain> <CAEth8oEdzomdn5avXf44HXpoMFDfGpOjjxPFtaGkh0EhfZsPMQ@mail.gmail.com>
 <CAHp75VeoZ7p=7e9CgZftT5hThf-uMaUrqZBv=+tNYiUOevUOnw@mail.gmail.com>
In-Reply-To: <CAHp75VeoZ7p=7e9CgZftT5hThf-uMaUrqZBv=+tNYiUOevUOnw@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Sun, 24 Mar 2024 22:48:42 +0800
Message-ID: <CAEth8oFPwBKPRdTFqgtC8TXYVp1QcRzz-tuwy03VkanWOWfSpA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 23, 2024 at 12:02=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, Mar 22, 2024 at 7:45=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> > On Tue, Mar 12, 2024 at 7:04=E2=80=AFAM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
>
> ...
>
> > > > +     chip->num_leds =3D (unsigned long)i2c_get_match_data(client);
> > >
> > > No warnings during compilation?
> > Yes, the compiler doesn't complain about it.
>
> And for 32-bit mode as well?
>

Hi Andy,

I've tested it with 32bits kernel build and the compiler didn't
complain about the warnings.

> ...
>
> P.S. You have commented only on the two comments. What about the rest?

For the rest, including variable renaming, error number shadowing, and
"%pfw" were fixed in the v5 patch.
I sent the patch but I forgot to add you.
I'll resend the v5 patch and keep you in the loop.

Thank you :)

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate


