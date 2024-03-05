Return-Path: <linux-leds+bounces-1125-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E4E8715A4
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 07:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72FC61C210B8
	for <lists+linux-leds@lfdr.de>; Tue,  5 Mar 2024 06:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2744C3C087;
	Tue,  5 Mar 2024 06:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BW9dlqIR"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2916FC1C
	for <linux-leds@vger.kernel.org>; Tue,  5 Mar 2024 06:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709618895; cv=none; b=mLpddf0NH+t8HwNoxfBTQEfb0ggc8h7m/GmxSJP6Oq2YotGmEGuKlMwOgk000+RgsOqX7zPeGCFNVGHgHEnYp1OcMbD8TCmxZ3q6fBbgXFXcN9v1AB4YbNcIrCm/yT7oLniZ9q0mO4I1+Hnw39yAsfFXzpO+19u69SeD0P0sH9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709618895; c=relaxed/simple;
	bh=dM4D7w9DD8d0wbriRkCoArYw4jGDzuzqEoVoQw02gzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=esUZGLtvgS+90q8vHH4tsWqYJmXQg2ese7JW7SXGHhHr+ZU3j5cey884KWymfMk7u/yHJbbsAD2TcWcdAya+ORuHR5ML79e4qyW3ILfdH5pQ2GDuJwrEkNnQyk2pZxWQkS9GA/ssxDZDd4YAkXIWSwVbEgBXcGnnYF6RiqjO5Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BW9dlqIR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709618891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoFo0I1fzWwGEu4UQgAN2SUdp7pXe6Pyro6e3fwhw64=;
	b=BW9dlqIRheS6t6PiJ9tgobqHvFQ1NJfUEfw529dRC2ShLxY/qKKZNGy/Le5FOmKNwx5kev
	Smt97w46zBju96erup/Lq8ullqvvuoxzXMFX7VrbpbC2AIPvsys9a5JsQu/vPtK3dRclRv
	I1idADwDOFv6pmjpJTgC5dVvAXzut40=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-MSn7Nqa0NWqQY9cREJrokw-1; Tue, 05 Mar 2024 01:08:10 -0500
X-MC-Unique: MSn7Nqa0NWqQY9cREJrokw-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-29935047600so4330389a91.0
        for <linux-leds@vger.kernel.org>; Mon, 04 Mar 2024 22:08:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709618889; x=1710223689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zoFo0I1fzWwGEu4UQgAN2SUdp7pXe6Pyro6e3fwhw64=;
        b=FZDUgkDZNtoVsrWGCIhSXRyNG0EvdA44yo800LZ/k4Yml+xTrfVGri8Ir4ydr1RLL+
         r9rfvzdIw2o2tETY496GxNEy8BJrq4x2U50mJxspiPgn3zKrZyW8YouaMzmG4ReEzXQh
         GSLh03FM1xUiyhcyFwTrTGEVeeVwBbDyyTXmAM+e2kpxsCFyC306emzZJeo7ayFN3U2D
         Amk01KhhzfLjnEMgkxjA7a5kVFNxnXyGorhhm06nHjClJpu4qsawKeam+B97xCtjrF6/
         yHEK1oFiXE5HZG6cUzLvM9f/CeBEgJiHErGaF5RieixE/3Ou/viwOKEq4IOPvkj+2oDP
         GmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGjASPRp+Of7fRdoZZl4QTDtDZtwty9G/OW1dyRzJiFegVz4D0yCdNidoOyPhc5VKJrVTcRbN+85ZcWmufdxeLognLqpeHaVc0Uw==
X-Gm-Message-State: AOJu0YzZ7HTiq/M5Ob4JaIBUeZTXOs0A4DftooiQXqA4ETKzRyDDxBik
	92zU0+mIhrv1ZGMwFLeAu5/rX/6MR74NOO3EygjfdlSgRx8gziRH9GwGeqVatuMdf5qNqLwk3QT
	IflvtlV+cyn2FLiyh74JZjd7mLrz8EKwYEstjLFyZhRVz0z5YKnyCpN2ijATbzwkBQt5A+Li9wi
	LnjNX5zkKT4TRIK0kY+VaDGgv9qJUgrypUFg==
X-Received: by 2002:a17:90a:fb81:b0:29a:1708:9878 with SMTP id cp1-20020a17090afb8100b0029a17089878mr10204703pjb.38.1709618889026;
        Mon, 04 Mar 2024 22:08:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHd+3bX2cQVrVff7vEVTyByHc1KRVzVm4ben3RVNkqLHuCs0o7H2AoV3FE+2l+eivntYagUvGxVF64lMe0rlf0=
X-Received: by 2002:a17:90a:fb81:b0:29a:1708:9878 with SMTP id
 cp1-20020a17090afb8100b0029a17089878mr10204693pjb.38.1709618888724; Mon, 04
 Mar 2024 22:08:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240301033612.11826-1-hpa@redhat.com> <20240301033612.11826-3-hpa@redhat.com>
 <7dc47181-af26-6d46-d34f-57be0fdc8421@linux.intel.com>
In-Reply-To: <7dc47181-af26-6d46-d34f-57be0fdc8421@linux.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Tue, 5 Mar 2024 14:07:57 +0800
Message-ID: <CAEth8oGEB8rhEhGu2ws8UnmpmsOV3VFnGtO98cf=1m4h=REh=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] leds: rgb: leds-ktd202x: Get device properties
 through fwnode to support ACPI
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 1, 2024 at 6:59=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> On Fri, 1 Mar 2024, Kate Hsuan wrote:
>
> > This LED controller also installed on a Xiaomi pad2 and it is a x86
> > platform. The original driver is based on device tree and can't be
> > used for this ACPI based system. This patch migrated the driver to
> > use fwnode to access the properties. Moreover, the fwnode API
> > supports device tree so this work won't effect the original
> > implementations.
> >
> > Signed-off-by: Kate Hsuan <hpa@redhat.com>
>
> > @@ -568,6 +574,8 @@ static int ktd202x_probe(struct i2c_client *client)
> >               return ret;
> >       }
> >
> > +     chip->num_leds =3D (int) (unsigned long)i2c_get_match_data(client=
);
>
> Casting twice.
>

Thank you for reviewing it.
I'll fix it and propose the v4 patch.

> --
>  i.
>


--=20
BR,
Kate


