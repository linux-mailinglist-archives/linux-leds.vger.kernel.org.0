Return-Path: <linux-leds+bounces-1357-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9868D88D6D7
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 07:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0063B2A33DF
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 06:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15BF12376A;
	Wed, 27 Mar 2024 06:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DMYdglGB"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC831DA22
	for <linux-leds@vger.kernel.org>; Wed, 27 Mar 2024 06:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711522423; cv=none; b=hUXELuLdFq8eQVl0ajKinc6pkWetcX/ah7Rk+FBhOpRWHGlQ0fBbr4Hak46OPYxRbbsXBwV0Iyvq/FqrzhsKVMWKrU+EFrwZeb0dZTzlvytxuDP/MqlpF5Yka8TWnlnMkuB0gApf4faHWaT7bsg/uEjLocpcxXzLM3HNQEMW8H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711522423; c=relaxed/simple;
	bh=W6RLXUxCHDJY3w70KCqWzO6oGutZMiRq4O8XdSmVm20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fbJOrzzM6h/qEAvdFRw7mc8gy62HQoj/6a3O/fwFjQT2rZPmMtdOEJlcv2tBQTzp3ZLNthnti134wcTdFCXn6Wtneh5whL5R091VCoxZyyvMuyHM1ggOpMcXN5rEl0lJig4c2qEA6sX3NhIoRRtEZCOWlFdXrNhIBS79nOJN6W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DMYdglGB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711522420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjyCvIB6syQyBLc/PURAesFgBPIAm7ixXYus2PqXUv8=;
	b=DMYdglGBptN5vBmIR3K0QnAMT99IlnNae/yg1KWDZyIDAco9sgAFvzmN9mOmEsBbmKn9lK
	KwyxM5gZJqzSV36esmIE0ZJkdmhs/K6hQmAt72Tx8CLTxMnTSCOUOLXPhTSR10npYVKqnq
	9uzfHKJgmLr6byFJRA0U7NWmRJBeHPw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-T-6g1t3pPNqXIxTUWDLAhg-1; Wed, 27 Mar 2024 02:53:37 -0400
X-MC-Unique: T-6g1t3pPNqXIxTUWDLAhg-1
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-5d8dbe37d56so4774640a12.0
        for <linux-leds@vger.kernel.org>; Tue, 26 Mar 2024 23:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711522416; x=1712127216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjyCvIB6syQyBLc/PURAesFgBPIAm7ixXYus2PqXUv8=;
        b=dGgOOzE07+/pQUZX0Z8Qmu9IVmPCRYQ/65SvfL1UyUOjmPFRyXuF984/hS1PwOc6lI
         6XtOUD6qgZdE4Aybi1kgxdO4+qWvVJR2h0Vun+p9pj5XJcUkvkkOziYzfxpuF5FsP/yT
         s1TsS5h1VvQIa5eJGvtVavaoxuu3Yf5hx8uMhJC/EOssT/nqgSRM3u1cDzuJbdYgODQG
         KYL2W/atLDmtu8TdGgNYSuRd59xUnW9pxo781Kzj1SvAdKkAS3DyoOfsBmoqr1UEBusf
         roajlkXO79/FYdR2741OaejCJykxnytDh2ieHcdWKBchmt6NUjQeFMDkZ3hEMNcA6MLi
         KPNA==
X-Forwarded-Encrypted: i=1; AJvYcCU8LWKa80827qcESjvMB2bTV6P44/JIWCd181O6yqH7OkYnveM422Qo3j5+B0usJu2BuCJuFCOSyfyrO50EBoJvT2cSVkvE/FKGww==
X-Gm-Message-State: AOJu0Yycjd3Frw3utHqhly5uFiTpxWyrz3GudgWu3dfnDkRnRogltLI8
	m6NFFzuoX7IRvPlsJGVQNxNO+7RFsLWan7YlhVHsSwAcnQUcMuLXKCAREwSLwT1JXOpc3PUwUCt
	w6NyazNPcPxAbYHxj9M+dIIgVLpNS6EiUTKfR+WN+wCi3re3efAVL4A4wx+8u/g3/LxFPcAHp6j
	AtZz+tnKGL3IpgVq+YN0Eo9HZzt6OVVa0Zjw==
X-Received: by 2002:a05:6a21:339c:b0:1a3:8904:1fc9 with SMTP id yy28-20020a056a21339c00b001a389041fc9mr3637940pzb.41.1711522416546;
        Tue, 26 Mar 2024 23:53:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE92cxDxgpu4LIAd0jfCXzzTSPP16EKFP9ZwNdIoRwWxtFgYT4c5S27JpSdRV4WKq/fyTzRxyP70R1xOrLebfs=
X-Received: by 2002:a05:6a21:339c:b0:1a3:8904:1fc9 with SMTP id
 yy28-20020a056a21339c00b001a389041fc9mr3637931pzb.41.1711522416229; Tue, 26
 Mar 2024 23:53:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324150107.976025-1-hpa@redhat.com> <20240324150107.976025-3-hpa@redhat.com>
 <CAHp75VdosbYNKU90QWt+6SU_i5dWC94=xZy0GXiKvoQeDF30wg@mail.gmail.com>
In-Reply-To: <CAHp75VdosbYNKU90QWt+6SU_i5dWC94=xZy0GXiKvoQeDF30wg@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 Mar 2024 14:53:24 +0800
Message-ID: <CAEth8oFuPTRq0z-YbMMFt=kKgre6x+bDhtpUkj2vJeK-u8O72A@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 2/6] leds: rgb: leds-ktd202x: Get device
 properties through fwnode to support ACPI
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for reviewing it.

On Mon, Mar 25, 2024 at 3:57=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Mar 24, 2024 at 5:02=E2=80=AFPM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > This LED controller also installed on a Xiaomi pad2 and it is a x86
> > platform. The original driver is based on device tree and can't be
>
> the device
>
> > used for this ACPI based system. This patch migrated the driver to
> > use fwnode to access the properties. Moreover, the fwnode API
> > supports device tree so this work won't effect the original
>
> affect
>
> > implementations.
>
> ...
>
> > +       fwnode_for_each_available_child_node(fwnode, child) {
> > +               num_channels++;
> > +       }
>
> {} are not needed.
>
> >         if (!num_channels || num_channels > chip->num_leds)
> >                 return -EINVAL;
>
> ...
>
> > +static int ktd202x_add_led(struct ktd202x *chip,
> > +                          struct fwnode_handle *fwnode_color,
>
> Can it be simply fwnode? (Originally it was np, so I assume there is
> no name collision)
It can be. I'll revise this.

>
> ...
>
> > +       count =3D device_get_child_node_count(dev);
> >         if (!count || count > chip->num_leds)
> >                 return -EINVAL;
>
> > +       fwnode =3D dev_fwnode(chip->dev);
>
> Why not dev?
I'll use dev. I had declared it.

>
> > +       if (!fwnode)
> > +               return -ENODEV;
>
> This is dead code. Please remove these three lines.

Okay.

>
> ...
>
> > +       .id_table =3D ktd202x_id,
>
> Seems to me that you may split the I=C2=B2C ID table addition into a sepa=
rate change.

Could you please describe this more clearly? Thank you

>
> --
> With Best Regards,
> Andy Shevchenko
>

I'll propose the v6 patch according to your comments.


--=20
BR,
Kate


