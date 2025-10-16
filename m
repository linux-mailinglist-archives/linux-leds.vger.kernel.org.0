Return-Path: <linux-leds+bounces-5802-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29891BE53AC
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 21:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A1F1895842
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 19:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B192D9EC8;
	Thu, 16 Oct 2025 19:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVoz1Ozg"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F382D9EDC
	for <linux-leds@vger.kernel.org>; Thu, 16 Oct 2025 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760642782; cv=none; b=s2YhY0V5SjrNzAQFl/Xl9vsw7OKYPINMRZHf6x1QLAouQSfbLbDww3s/4SjSEBe9rkgS9kk/T+om8MZKq1cxKu4XTGB7PWjLU3DZGN9v7UTNLbHTx02IGiT05CsaaK5xxAuUXRq92sQLeYXHTJd05QvYDQ0tDc7wzuMSta3BuGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760642782; c=relaxed/simple;
	bh=dEdNWeS2Gl2d+o5mW29vrd0DAG/c+gnVlrDIH6uDqEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yd/+kKfKXPmTFYQdst9NbzY5pvWNXn0hn35cQB3mWU1ikPu+QulYkFz6ZNxSnE7qXijdU24HHyYy5zV4gYFJLNkYAA52vBPdBSoJAogojTNORUuyBA8W6rvolDoaOxeROEcq3x4CgZ5chxdYMmOgTWpByYPTlRlJDUf4hsXzTIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVoz1Ozg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4710683a644so10873655e9.0
        for <linux-leds@vger.kernel.org>; Thu, 16 Oct 2025 12:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760642778; x=1761247578; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNxIenbZ/7hzw57JYZtengUf/MrdPiNanFMm+UB+8O8=;
        b=VVoz1Ozg5rTDc2PDRxNG2Lir69VI5GsMI5FI/bJbNWyBc1uqtzP+4ugJrWtqiAGUJN
         cnovsNQ2WMkhhRag155OATpDbqA0V9UFAwmRwMNulitl/87QfzFCTRNMl8T9XtF+v2A9
         C+8f1oazoY1F+nL9VQneSzqLnlDmaQgLFJYOVwo5p0b6qI4zIDnTwCbIGPc5vBOFpXyx
         b5/8Ab44hYV+F9GiGXESyzJNkpSyI3Rqo95NRcT2okecMJWRsgWQgtsI2HKY2PB5Jgub
         fF6MpUIkoQJQk0DmxppOCwuTK8+SIjh52isBkBFejzeRjm94k9e2p8w6zW6oPUYEp5ZQ
         5fuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760642778; x=1761247578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNxIenbZ/7hzw57JYZtengUf/MrdPiNanFMm+UB+8O8=;
        b=Vw1GuTzCkkhtUfKspPXOH/WrA1XqIlnHtRKch3u+nS0xkGPd75ryk7w8F0FGieTRTx
         svxgG9uN8TYegxS56MtqQFQcJ1D+mocIRC2f4LZ7UTY0Mkmho3bnKKtKxq8GdNcJoEEo
         o8Mm9jRUp4yNq6d5CFDnM8OjcYuK5JcbSs0y00IbDk6LuAaVSfgGJRuN5ibfxeOmLRvP
         pJA1ZyHcUrh9CNvDpGwjiz7+I/XVBO5dPl+mWM8nPMXkF3PffAdXlnJJ91xSPWBZBo5L
         ItMrZcFguUCccBfnPpwi7Jl7ynFt8ARugIry8QZ4FZMMmMHJU2p1jDZQp721QSKUPN7r
         xtag==
X-Forwarded-Encrypted: i=1; AJvYcCXNPx8v9JUN2eXKHdKmApBsJaOQGrj4IDoqgWXCEe+rHpIvrUmuMJLhpdOdt6WTVmDLTJs6eG5qMEnN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnw0WnZI8kjE2PGhq01Qej9BA4YgVOiwSanfzVudrMoi1tDp4U
	Z+VVKwRcvgXfWzuPllyzzBUpOwzST4jbBIE4YC4iw8CTgd5eKGH/eb0+o8SEHG9RT9qdv3Oazcq
	mPUb2rS2NU8LrudVDnrsVU+bGaEfGB+A=
X-Gm-Gg: ASbGncv0xQ3DvUvdLMDnQfgS/mqu+UnYIupq3fSpJJhC28oFajdelEPzDFsqa5MCIjG
	ch9p3ss9RENoX6RS1f0bCfiJeU3Sv1M1vaxrXGzHkbjqIW2c2f4Ds4bhS3etIf/s5nZIEFSbVV8
	TYK4B976bPqQQuHBCTf2IZRy+AAc1gZI/TqQB/fwQP5jTRXyiY6i/x1xMytaXyeD7pJtzR032LE
	HyHPjwQiZ+z/P/8f2fxFh1enjnDQDUylOyJZVd+ZqgFK47WRH/gdxEyRXJkhOg=
X-Google-Smtp-Source: AGHT+IHkan6OSTsij5o2t2wdP7ZlC/6va0mR/d/Jvu+zXEN5PoMH3NcxLC3JAOwzBotWh9eaPBygA5v21SyF/7JVxYM=
X-Received: by 2002:a05:600c:820e:b0:45c:b6d3:a11d with SMTP id
 5b1f17b1804b1-47117227aafmr11596675e9.1.1760642778305; Thu, 16 Oct 2025
 12:26:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210601005155.27997-1-kabel@kernel.org> <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch> <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch>
In-Reply-To: <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Oct 2025 20:25:49 +0100
X-Gm-Features: AS18NWBmO2Md7kkd9r8UiisL0OcfM-UKSJHnmxYYZMqkpd6ApOTIMYWYDieIuBk
Message-ID: <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
To: Andrew Lunn <andrew@lunn.ch>
Cc: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>, Russell King <linux@armlinux.org.uk>, 
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Thu, Oct 16, 2025 at 8:11=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Oct 16, 2025 at 07:53:17PM +0100, Lad, Prabhakar wrote:
> > Hi Andrew,
> >
> > On Thu, Oct 16, 2025 at 2:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > > Marek Beh=C3=BAn (10):
> > > > >   leds: trigger: netdev: don't explicitly zero kzalloced data
> > > > >   leds: trigger: add API for HW offloading of triggers
> > > > >   leds: trigger: netdev: move trigger data structure to global in=
clude
> > > > >     dir
> > > > >   leds: trigger: netdev: support HW offloading
> > > > >   leds: trigger: netdev: change spinlock to mutex
> > > > >   leds: core: inform trigger that it's deactivation is due to LED
> > > > >     removal
> > > > >   leds: turris-omnia: refactor sw mode setting code into separate
> > > > >     function
> > > > >   leds: turris-omnia: refactor brightness setting function
> > > > >   leds: turris-omnia: initialize each multicolor LED to white col=
or
> > > > >   leds: turris-omnia: support offloading netdev trigger for WAN L=
ED
> > > > >
> > > > Do you plan to progress with the above series anytime soon? If not =
I
> > > > want to give this patch [0] again a respin.
> > >
> > > What features are you missing from the current kernel code, which thi=
s
> > > series adds?
> > >
> > I=E2=80=99m working on a platform that uses the VSC8541 PHY. On this pl=
atform,
> > LED0 and LED1 are connected to the external connector, and LED1 is
> > also connected to the Ethernet switch to indicate the PHY link status.
> > As a result, whenever there is link activity, the PHY link status
> > signal to the switch toggles, causing the switch to incorrectly detect
> > the link as going up and down.
>
> So you think the current /sys/class/leds code is not sufficient. You
> can use it from udev etc, to make the LED indicate link, but then
> userspace could change it to something else. I _think_ only root can
> use /sys/class/leds to change the function of the LED, so it is not
> too bad as is? Or do you really want to make the configuration read
> only?
>
I haven't explored the current leds code tbh. Can you please point me
to any PHY which uses leds if any.

Cheers,
Prabhakar

