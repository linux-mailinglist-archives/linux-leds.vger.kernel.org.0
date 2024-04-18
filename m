Return-Path: <linux-leds+bounces-1498-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A77888A9341
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 08:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37603B21764
	for <lists+linux-leds@lfdr.de>; Thu, 18 Apr 2024 06:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE9D21103;
	Thu, 18 Apr 2024 06:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V9pML5H1"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0178925777
	for <linux-leds@vger.kernel.org>; Thu, 18 Apr 2024 06:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713422423; cv=none; b=f1nBY3/sqScyTxaoopcV9yUjTRAq9CoRkCvU8rHjWU28pqkC1v7NSTwZjSgl3Lx69UijUovpxgCRVRFEwbkR6+cokn0qMzktPWC4Q8qA4sBBPkhHgETmdwgPenDtrZJlb69s2wHTiDv2TkHMPwEyg/fHOBz12YniKJJO78r7hPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713422423; c=relaxed/simple;
	bh=EH03m7eOfHhtp/BcJ5vnIqquDs8mG7Y94m4YaqVAYs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yi97x7NKhbg9pDrz9VlyG4UMhRXwIuWN0EvvzSccmMurVM6yN5WGDWeSIhDSWkxUzPmcm5tqKGLMJfUqxhmLlF0ClSTONjsD2IM9CwxUJHuDqwgX2ZYM8YortaKdrQVMcbhyc6R3DZ7rSA6DHylO7Iw2mhe+uL5D4EhMEWLh36U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V9pML5H1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713422421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNvjTCc6FwOgFUSAbxLYa6iTeIgRgSjn22Bb0lwJRLg=;
	b=V9pML5H1to4SQmlXIRkId9OtvnmkTpc99lX8L7oCmIiTtvpPdsxnG01E5AZJP4mLWhpSt2
	7g5M8s0RUnzYah0dIlYdGF5pFcyQRxL+wwuKcRxiVCABYKRji3PjfwNuOw7aBMrFqr2mis
	5mcj14bp6IOpz3CP5LhzhUjd3p2z4Xs=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-HYoNPyi-PbqfMzFiMesH7g-1; Thu, 18 Apr 2024 02:40:19 -0400
X-MC-Unique: HYoNPyi-PbqfMzFiMesH7g-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2a482a2360aso1468549a91.0
        for <linux-leds@vger.kernel.org>; Wed, 17 Apr 2024 23:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713422418; x=1714027218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNvjTCc6FwOgFUSAbxLYa6iTeIgRgSjn22Bb0lwJRLg=;
        b=WR0RIm/FENi+gMqFP9U86Ldntxw4k0+xPGaT/+A7Cog3s4dr1OELGe2BpBGpf9HEWo
         6iGVF8ftP7rbnQDiKD+uXuA2Dbozhs6MDHVD3c2E4g/81vvqvxn8a/40SP2wAM4I3STg
         B4H9gVqBliBkr6z8iu5Nijy9BEuGY1u7sf0ZTg0GyUVzcr6A2cH/8aRPsb/3KXHkbr6U
         Lp3h4O6jpcWKSv8dzm2sPwwNLnASl6SMfnkFWi4QkzvKLAMN6FQ5Bd/b1yKNrduA1QwX
         VeVoet3ALfPxSFa/5poqy87qPOvCA2+TOK67vbu9EA4q8n6LFNJ7zaUMhmHwuG5stS2a
         NTrw==
X-Forwarded-Encrypted: i=1; AJvYcCVJwV5RNOYCPAUJK2Xd3x81eTxbZ8fmG9keD06q6sq6lAh/hU0pUDOreAvKd17xyh+5Zss8sxnkctI2EVnhn5q7QtDicqD6DxcsSA==
X-Gm-Message-State: AOJu0Yzaq2HgcR8eI7+Syc13WALMPiNw7l0mA1m8Cz+K+Haco/A7Y1G9
	Kt6WuLehqLdIgkTDkoPImcwEyVH9FedR6Bzjrh3iRDt2UT2MrzFw06ZBUSaH1ERiQtf1tmTS7+x
	79xANi07EYY2MdaR5OII6Qai3FOIlOw76VZJgSQJS+DfP8DsTkEiLCjKvsAPE6bBUNbDF179A4V
	vJR5E7/6cANeFSKgMLU9UZNYb+iGYKz326Og==
X-Received: by 2002:a17:90a:f298:b0:2a4:6ce7:37ad with SMTP id fs24-20020a17090af29800b002a46ce737admr2168447pjb.5.1713422417933;
        Wed, 17 Apr 2024 23:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8Nqu/T3TcMgalwb0fgZz/LJ+EbTdQaBlb847ZkHwH6OthK4zjz68lfXhfvPUEvk2KNoUUWyOlK+WujobCKuY=
X-Received: by 2002:a17:90a:f298:b0:2a4:6ce7:37ad with SMTP id
 fs24-20020a17090af29800b002a46ce737admr2168419pjb.5.1713422417577; Wed, 17
 Apr 2024 23:40:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416053909.256319-5-hpa@redhat.com> <202404170023.1zEGO9ja-lkp@intel.com>
 <CAHp75VeKCGSZTb5bGU4YNr9r-z+gXmk4GC5HOZCFcoRQRN37CA@mail.gmail.com>
In-Reply-To: <CAHp75VeKCGSZTb5bGU4YNr9r-z+gXmk4GC5HOZCFcoRQRN37CA@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 18 Apr 2024 14:40:06 +0800
Message-ID: <CAEth8oF8rXABQqhM89QH4dR=Gqjv-ZkwPHWMEfy434jN6eOtbg@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] power: supply: power-supply-leds: Add
 charging_orange_full_green trigger for RGB LED
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: kernel test robot <lkp@intel.com>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 17, 2024 at 1:34=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 16, 2024 at 8:03=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Kate,
> >
> > kernel test robot noticed the following build errors:
>
> > All errors (new ones prefixed by >>):
> >
> >    drivers/power/supply/power_supply_leds.c: In function 'power_supply_=
update_bat_leds':
> > >> drivers/power/supply/power_supply_leds.c:42:17: error: implicit decl=
aration of function 'led_mc_trigger_event'; did you mean 'led_trigger_event=
'? [-Werror=3Dimplicit-function-declaration]
> >       42 |                 led_mc_trigger_event(psy->charging_orange_fu=
ll_green_trig,
> >          |                 ^~~~~~~~~~~~~~~~~~~~
> >          |                 led_trigger_event
> >    cc1: some warnings being treated as errors
>
> Probably you need a new dependency or so.

I will include Hans' two patches for led_mc_trigger_event() in v7 patch.

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate


