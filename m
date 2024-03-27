Return-Path: <linux-leds+bounces-1355-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBC88D63B
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 07:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A523C1C24667
	for <lists+linux-leds@lfdr.de>; Wed, 27 Mar 2024 06:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDA11C680;
	Wed, 27 Mar 2024 06:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="W/6GPhkS"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BB5134C6
	for <linux-leds@vger.kernel.org>; Wed, 27 Mar 2024 06:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711519810; cv=none; b=CB+1d0nRpdEqmiI8WAA1WSnhPcV747Y0Y7IhoBzhtV1IczQUAO1ZVHC4dSqPU4v5/nFVe6w7LVqJ27wQYkiyub3TsvaldLQbbwXqLULekFGrQGR4ZCbfSUyXDKbT7772wJinTqTbJ1aEWa7C3jFPd+umPmcMB8OeogjFTzBTlrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711519810; c=relaxed/simple;
	bh=aj1aL6upPcAi/oYsdf1FW6tZ/Jif1m82oyTDDBx7OMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pE6LczUTJhyzxdml3RZz/ccD+E0cfEqlAuux7RGhOZzGaQCiAvqAQIsKioqgHwcMt1WAR+Pal94pRfrcpm9HhSr2Gtdm+bkeLeMYnAWBVYr/2pOe1WsUBLh6m/vcmY1rStLd+TyTpHSWY9/rcicqIJb5/9KSXm6QaKu4IQC9st4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=W/6GPhkS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711519806;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aj1aL6upPcAi/oYsdf1FW6tZ/Jif1m82oyTDDBx7OMo=;
	b=W/6GPhkSiygq9EXpGKEGBGcaF5YNj4Oc30TZVYvZjqWmAQKmD10swIzPV5W3MTRrQ89Sv8
	Gh56MoFWzAsQAVIYhrIxH1AreQI4vwfWclvEffTpE3aSolj9PcEy0kjLfptDVPN6HTlgxF
	4MArxMot4qBiE7R6GCi81pAG9dFi+aE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-eqqb2PjWMFOfUwT1jq9COQ-1; Wed, 27 Mar 2024 02:10:05 -0400
X-MC-Unique: eqqb2PjWMFOfUwT1jq9COQ-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-29feefd1a95so5102226a91.2
        for <linux-leds@vger.kernel.org>; Tue, 26 Mar 2024 23:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711519803; x=1712124603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj1aL6upPcAi/oYsdf1FW6tZ/Jif1m82oyTDDBx7OMo=;
        b=R6OaqSNqPuinBNgBIiNbzKzTBSVKpdyvM/zldAd8iRf5A81Q044AlVBqdPEWSpmJpt
         sqHgwWqjsN/iXQBiuET+eMyDalNIKIhRp/UqJ/OMXTTQCQdqBd2xvBNw3njDExl0IrsK
         ENJxGW0SF+NUeWcAoRofaph96W3AWaqETWCYubS4Y51Cz2t9QCT0zGp+TVnP/vKhumdj
         VCHst2rPIP3zTjRWk7d56fcXmSntFkyEeaclRjI8MItnC0SZ1USjxOzuA9eZhbkDzLdQ
         4DKU2VvJW7Ks7GEpggzBHztFJJZth29m1B4kYect6es6Kq3FlxqSyvAxHXOGNAzp1BDy
         gpog==
X-Forwarded-Encrypted: i=1; AJvYcCVxK2VHyfuMATbjQ6WEsHhZZeuG/j93e0ObeSdeKguq1K9GgXgHV2rV5c1UK5LLl2RK5eYCA1M0B0+VMplYTvGP/o0LX7+BhdWlRA==
X-Gm-Message-State: AOJu0Yxk96N0hgN9zzy8lqG1bFcZCCP8COsa5lYEOM+To3hAEZyU4rKl
	bf4V6hFfxwb4urZ1nzz8qWk6XNLcFkKkYFKozASZUamhtkr8YDCB+J12T9Gve4oTVqzcCHeQptG
	ksR9n49TOEeAMJfXy+BsE8ZcZMbG3H8Q03qFo8keVo1F96vCSoksXys7qdoJ6DdFrquJ5m+M44/
	wvDGZT1ugerKuL9hjrCpGyUEhxVJsqGgFqVg==
X-Received: by 2002:a17:90b:3ec6:b0:29f:f6c7:1ace with SMTP id rm6-20020a17090b3ec600b0029ff6c71acemr1806624pjb.32.1711519803676;
        Tue, 26 Mar 2024 23:10:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnJ9eZnxGImAgN6jxUMCflVFqJDA9V46b7u8wTdTfp151Xu61S6bJ6bs/eJvZiZf6QsvrT47Be/7ekcgEGtgw=
X-Received: by 2002:a17:90b:3ec6:b0:29f:f6c7:1ace with SMTP id
 rm6-20020a17090b3ec600b0029ff6c71acemr1806611pjb.32.1711519803228; Tue, 26
 Mar 2024 23:10:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240322033736.9344-1-hpa@redhat.com> <20240322033736.9344-2-hpa@redhat.com>
 <bb7536be-9bed-4557-b111-6409ebfe48f4@redhat.com> <ZgGm7eDBQtwH37ya@smile.fi.intel.com>
In-Reply-To: <ZgGm7eDBQtwH37ya@smile.fi.intel.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 Mar 2024 14:09:52 +0800
Message-ID: <CAEth8oEps=T3JGJiCEH_SknjkcGaTXv+ekBQLgVRm+Nc7qfa1g@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Hans,

On Tue, Mar 26, 2024 at 12:32=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Mar 25, 2024 at 04:02:54PM +0100, Hans de Goede wrote:
> > On 3/22/24 4:37 AM, Kate Hsuan wrote:
> > > There is a KTD2026 LED controller to manage the indicator LED for Xia=
omi
> > > pad2. The ACPI for it is not properly made so the kernel can't get
> > > a correct description of it.
> > >
> > > This work add a description for this RGB LED controller and also set =
a
> > > trigger to indicate the chaging event (bq27520-0-charging). When it i=
s
> > > charging, the indicator LED will be turn on.
> > >
> > > Signed-off-by: Kate Hsuan <hpa@redhat.com>
> >
> > Thank you for your patch, I've applied this patch to my review-hans
> > branch:
> > https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-=
x86.git/log/?h=3Dreview-hans
> >
> > I will also merge [PATCH v5 6/6] platform: x86-android-tablets:
> > others: Set the LED trigger to charging_red_full_green for Xiaomi pad2"
> >
> > Once the new power_supply trigger patch this relies on has been
> > accepted.
> >
> > Once I've run some tests on this branch the patches there will be
> > added to the platform-drivers-x86/for-next branch and eventually
> > will be included in the pdx86 pull-request to Linus for the next
> > merge-window.
>
> I believe I have commented on the "RESEND" version.
>

Thank you for your reviewing.
Please review the RESEND patch and I'll fix them according to Andy's commen=
ts.

> --
> With Best Regards,
> Andy Shevchenko
>
>


--=20
BR,
Kate


