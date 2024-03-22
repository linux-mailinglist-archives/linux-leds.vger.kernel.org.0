Return-Path: <linux-leds+bounces-1292-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 773438865A5
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 04:49:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 208601F247CD
	for <lists+linux-leds@lfdr.de>; Fri, 22 Mar 2024 03:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979E13FEF;
	Fri, 22 Mar 2024 03:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FyhA6paE"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B5E3C17
	for <linux-leds@vger.kernel.org>; Fri, 22 Mar 2024 03:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711079348; cv=none; b=Rd5f9A88fttpyguscLebMlt0nDH1mMoePKu4hsCA+TSpggmSsKRlOqgFoQDVs7TFeatFkWLtuW29BOB3nWriwxNMU6hDL1SuKuGsCqLwkknw+kTmEtBawll56FJ6GLIQpCaEBBLP3tXt6wJm2pNmfTcM8yojkOnkBbvaWQ7n4SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711079348; c=relaxed/simple;
	bh=fH5HGlugp5nK0EFzK8QgCD3fs9E7YRkrMiwFQBZryEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Swt8/fDBkVdoLNWczphpgFomA+XFgoqaj+4voX12zZDrAJRi3ZyolAX7uGAG2dQ+oH9US+iRXoyY/hVvpOP/FBBUdYrzJCVGaAQFXm6q5AttoyR/hnNdytK+CLDp2A5E2nFvbsWcPrt0OS5np3mjIQdCSRbxkBBT/2k5VFBIKAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FyhA6paE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711079345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+HEBvOrXPUqLfHolzDCmiQaPfr7YEuqh+rp5togxB3Y=;
	b=FyhA6paEwAsAAe0N/6YQcW2KJrvP1fhcvPDsNTONdp1QMIc6nP1YBT0pfp6myf4isSnfmu
	TG9OYzr5W/u10oIxLj9XvxHal6oWL25k50gAvl5k8wyIDvCpzwwnjyviMFVsSwInXfScL1
	8XbbtXplyIr29oNwCj5CPUl4A8MB+Cw=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-dshWB41SNlSLXHWtzlUZrQ-1; Thu, 21 Mar 2024 23:49:04 -0400
X-MC-Unique: dshWB41SNlSLXHWtzlUZrQ-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6e687f8d275so1521916a34.0
        for <linux-leds@vger.kernel.org>; Thu, 21 Mar 2024 20:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711079342; x=1711684142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+HEBvOrXPUqLfHolzDCmiQaPfr7YEuqh+rp5togxB3Y=;
        b=jDeGaUZXFZAZNnO3Ye6CfjqUk5P9W3fK9jTVPL6hiK+JZxr5dQfFaorQMdQV0aXTxG
         CjS95qMoe+KI3v9Gm69V8DxorNPmeuYrVE91raW7ge5ylhs+T13UQ2ox9bkbnVl83xxi
         7hnx1OheAgCtJ/GI1xNxUx04WyNUdOBMR+ogzwRvAOewSdD4URY4zLmsAN7WnziJE1tu
         zQ2gCijoIYZH7Jw3+tNRURuDWaOj6HO4nvVjMiRRCIGjar8ejMaX+UEO9TApCRF3Eqxv
         xYQ3d5w8dVv/S0c6Fzqw6dRl1WmsslJI6NyuXoEXSP8JJA1AB+UdUzoLNY7ZC7cUXFXk
         Gpaw==
X-Forwarded-Encrypted: i=1; AJvYcCXezr+V2phxbUXN+jO8TauRSoMdM6wT/cLro3BghN0JUxvdyrPmS3I5pG64OltO25R1NEJ4AKLZdSd8NIXNG/kZy9rla4521SPn0w==
X-Gm-Message-State: AOJu0YwYxtXFJG478oUH/CW/nDaY7ELFaaLd2v0N/UwKhrfQVLqyKHQN
	Swa+LKNiHCpZAGS3XiuxKX3STyOIm0a62FxvMgIjBlasQ9zbXW2qT3SlyZmf7FgkPAbgqQhGjIZ
	in8DYyfXhHIugUlX9J56PgdzJy0fLNgKE/EAQ0N8XXLRhM+qsC9opZONGy+GbvUZs7wOHeEBjeu
	VYurg2Ys3w7CCr+jV0m7GGuHt8wL6MV9vmaCcunL+30snL
X-Received: by 2002:a05:6808:191b:b0:3c3:5fa7:bfe1 with SMTP id bf27-20020a056808191b00b003c35fa7bfe1mr1388446oib.0.1711079342594;
        Thu, 21 Mar 2024 20:49:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMn9tSg22pIjK2oNj74w2HiH8N5smBaMaH5gEit2Zuie0+C8/okSasJfwl0P+p7uEc6oy2wnq4CJviCzb/N2w=
X-Received: by 2002:a05:6a20:842a:b0:1a1:876a:9cce with SMTP id
 c42-20020a056a20842a00b001a1876a9ccemr1667550pzd.42.1711079015528; Thu, 21
 Mar 2024 20:43:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240309190835.173703-1-hdegoede@redhat.com> <20240321181849.GI13211@google.com>
In-Reply-To: <20240321181849.GI13211@google.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Fri, 22 Mar 2024 11:43:24 +0800
Message-ID: <CAEth8oE4QKjBM9UXSMGzLgZWmktN_=mycgNyyzVQkHEnNMR2gA@mail.gmail.com>
Subject: Re: [RFC 0/2] leds: Add led_mc_set_brightness() and
 led_mc_trigger_event() functions
To: Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, 
	linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 22, 2024 at 2:19=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Sat, 09 Mar 2024, Hans de Goede wrote:
>
> > Hi All,
> >
> > Here is a patch-series adding led_mc_set_brightness() and
> > led_mc_trigger_event() functions for changing multi-color LED colors
> > from inside the kernel.
> >
> > This is a preparation series for adding a new trigger to
> > drivers/power/supply/power_supply_leds.c which changes the color
> > of a RGB LED depending on if the battery is discharging (LED off)
> > charging (LED red) or full (LED green)
> >
> > This is marked as RFC since the power_supply_leds.c changes have not
> > been written yet and as such this is compile-tested only atm.
> > The main goal of this RFC is to gather review feedback on the
> > chosen approach in these 2 patches.
> >
> > Regards,
> >
> > Hans
> >
> >
> > Hans de Goede (2):
> >   leds: core: Add led_mc_set_brightness() function
> >   leds: trigger: Add led_mc_trigger_event() function
> >
> >  drivers/leds/led-class-multicolor.c |  1 +
> >  drivers/leds/led-core.c             | 31 +++++++++++++++++++++++++++++
> >  drivers/leds/led-triggers.c         | 20 +++++++++++++++++++
> >  include/linux/leds.h                | 26 ++++++++++++++++++++++++
> >  4 files changed, 78 insertions(+)
>
> What is it you want me to do with this RFC patches Hans?
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>

This is used for the Xiaomi pad2 indicator LED to show the battery
status in a multi-color manner and it can be found in the following
URL.
https://lore.kernel.org/linux-leds/20240322033736.9344-1-hpa@redhat.com/T/#=
m577efb6549aeb29d2813faf8c51ed38e9e092598

Thank you

--=20
BR,
Kate


