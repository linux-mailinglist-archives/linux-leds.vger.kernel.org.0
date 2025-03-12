Return-Path: <linux-leds+bounces-4237-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C2A5D4BC
	for <lists+linux-leds@lfdr.de>; Wed, 12 Mar 2025 04:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 107967A9D1D
	for <lists+linux-leds@lfdr.de>; Wed, 12 Mar 2025 03:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C138F19DF52;
	Wed, 12 Mar 2025 03:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SCdnctzN"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9BF1AF4E9
	for <linux-leds@vger.kernel.org>; Wed, 12 Mar 2025 03:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741750205; cv=none; b=n2iyOpWpCiYcjLrWgNsXVpb2nrKFSUfTqyqPTUyKx/+e17AOLVk2BMiLF6kxYfgFXcM8xw8vYKVl8WkarRwBwMpnp9cxJo0+wZIrKItopO25m8NuylvqYLrwgqiPlqbI/WoYRoZLu4ytZ/xugxOBufwJvhn30jtETISZoIaBCUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741750205; c=relaxed/simple;
	bh=8lKtlD878CpQP9xdYqFaFtx3UJlB12BxxXmMp7FSGqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYclgDj+cewShO4L9tGWcSNvQT4hPBm0xn9Rq1M3bDH8aV4aYHdK/6GXBEHm/kMfiynlEA0ygoWNJGSEqk6AnQGsFRJC0z2MvkMwHXm+R/ZuN2fwT8QWmAcicWJkI0f3734LBw96NuplRGK0xoGZYQwwryGXhU1GU4D5BF/A2c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SCdnctzN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499c8c95beso2988e87.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Mar 2025 20:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741750202; x=1742355002; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTC6q0jJyCwm0Ms6LHn8x6WPWhr3FL+RLBtkQPmtIBA=;
        b=SCdnctzNnSQ6OV94jeyRzz30MMnwKbd/5DR3O/n9/ZAEWRmHwSq23ZieiscVfXd2k3
         XfDPJcXyI2Uh8RWOWMcINcUSEi3w8miJif/NMwqoe0UtaeFSnZGhiQ354mOz47F0p31l
         W/QEpUcu2lHpBvpzhHyADnj9J6nnw1xqCBquRj064VT3P57hjd3UZmuXiDkXsbpwD7WY
         RUn73/+1gs0JdvtLneFsbO9XZ0+m1/oufcO8FxdUIRlgsi7kVvX0rPj31/zpSqbZc961
         VGFQdIm0flEBAuAqgblCOp6SXqv1qj5NrFd7mdUO61wO01BqhrPl1mCk/6501yb6wtHB
         sorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741750202; x=1742355002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTC6q0jJyCwm0Ms6LHn8x6WPWhr3FL+RLBtkQPmtIBA=;
        b=XrQOgxVrTmkz55i8WM86Df2MX1os3+zLUD+LFxipyGky8ayITamb7fEGpGKEXMn5gH
         aGhQC2Ooj5W4qudq66hG6rg8mXghAYY/a9Cr4gqAES1fgoGPrADI9O9v8RiwXJ7kHs6U
         Njx8ggn8+MbdjmnUzWFmsKEWI4zvomTdPKInjEqF5hCBJ1xtsqpzXSVJ9V0QQpMGthFr
         HqLKaEwXlUuQAtvOdBDfy706SRuxWE2pynxb6JR4vglfasVSoJAPUU7gCstsLPvbp3+2
         Ofs+UKPZWC0QlU59z9GO6ppck05INb7FedInB+FDhvaicltWb7PXcCJWFqVxIf4aou+K
         5vtA==
X-Forwarded-Encrypted: i=1; AJvYcCWq4GMjEERS4UuqB2puOsYzsT1KiXOFCIYrsLc+gH7Q5tI+OotYB/IHXwno07ff6/FYTZYwxyH9QRp/@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCyWqVleN/n+l94fZimRCDBK4bO0Z3oXxvUlLAnh1Edz1AGon
	FX3IVqX1+gR4cSNxP8SZuaa2sEE80nxKILuGMBMFHOp+q/MK/1PV1snAJa4mE1zyJyQnFD33RaS
	84hYpY1XPd2DQhQtGjcwjbcmZdtTJsYS1y5RB
X-Gm-Gg: ASbGncs2W86+71IhHVEQF5meazSIbNsDWTmNJ/aHQypf8QkyriD29LWTxiqKJsvrP0e
	AaVCmT51IPa3B+x0R4eQZDzuJjm+YXGfzcfSLOq76peXTFTXm+O4TXV9Tp6Kx8x/TmjllRa5xva
	lUolric2Y5qC7lkYx+RybZjijxTOYMCeUiV/nteKrggU48h575e9HBBHB3
X-Google-Smtp-Source: AGHT+IGP1YVSO5G5A7NPOF9hu8UMZmUxtP+Fj7fvYTNYvV5zNSe928DhT3IQzPqsLEwOPja96dJF23KWfgwjHorjZPM=
X-Received: by 2002:a05:6512:3c96:b0:545:1dea:7b2e with SMTP id
 2adb3069b0e04-549b1c370camr195846e87.6.1741750201654; Tue, 11 Mar 2025
 20:30:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250310150835.3139322-1-andriy.shevchenko@linux.intel.com> <20250310150835.3139322-5-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250310150835.3139322-5-andriy.shevchenko@linux.intel.com>
From: Kyle Tso <kyletso@google.com>
Date: Wed, 12 Mar 2025 11:29:45 +0800
X-Gm-Features: AQ5f1JqezutAuLR9RCiDwHugv6YDAlJdEYt9fLJCmtrMads3aQIZSAKhgQtQ5Ys
Message-ID: <CAGZ6i=0GuBvEU41Offobn1MzMuFumn9F6JLHXsKppPidkjCLVw@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] usb: typec: tcpm: Use fwnode_get_child_node_count()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rob Herring (Arm)" <robh@kernel.org>, 
	Markus Elfring <elfring@users.sourceforge.net>, Jakob Riepler <jakob+lkml@paranoidlabs.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-usb@vger.kernel.org, Daniel Scally <djrscally@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 10, 2025 at 11:09=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Since fwnode_get_child_node_count() was split from its device property
> counterpart, we may utilise it in the driver and drop custom implementati=
on.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Kyle Tso <kyletso@google.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.=
c
> index 9c455f073233..8ca2e26752fb 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -7166,7 +7166,7 @@ static void tcpm_fw_get_timings(struct tcpm_port *p=
ort, struct fwnode_handle *fw
>
>  static int tcpm_fw_get_caps(struct tcpm_port *port, struct fwnode_handle=
 *fwnode)
>  {
> -       struct fwnode_handle *capabilities, *child, *caps =3D NULL;
> +       struct fwnode_handle *capabilities, *caps =3D NULL;
>         unsigned int nr_src_pdo, nr_snk_pdo;
>         const char *opmode_str;
>         u32 *src_pdo, *snk_pdo;
> @@ -7232,9 +7232,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,=
 struct fwnode_handle *fwnode
>         if (!capabilities) {
>                 port->pd_count =3D 1;
>         } else {
> -               fwnode_for_each_child_node(capabilities, child)
> -                       port->pd_count++;
> -
> +               port->pd_count =3D fwnode_get_child_node_count(capabiliti=
es);
>                 if (!port->pd_count) {
>                         ret =3D -ENODATA;
>                         goto put_capabilities;
> --
> 2.47.2
>
>

