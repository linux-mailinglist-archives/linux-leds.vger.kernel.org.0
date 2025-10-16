Return-Path: <linux-leds+bounces-5799-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C998EBE51E1
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 20:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE19B1AA0891
	for <lists+linux-leds@lfdr.de>; Thu, 16 Oct 2025 18:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 771F823D7D9;
	Thu, 16 Oct 2025 18:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ob8y+cQ3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A2823D281
	for <linux-leds@vger.kernel.org>; Thu, 16 Oct 2025 18:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760640827; cv=none; b=FgNgWGcUwNEjZBk7C/5VftAvkjM7iemNZa0XXeBreAmB30soQETATvsxzygy+K833A4Kq7UU1AE6wdaudod62uMzy667WtESm9Sx4mUrMOPNa8k3NXwdY0EFvdtFMD21N/y7YICAMTJsWDDq4BCEZR3tEeVfVlYbO1ubdaLIK0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760640827; c=relaxed/simple;
	bh=MJ04rX3XkSBkvTok/bJnoouZLIdDfY2CseOfTojI+2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CC8LT5SotG+y0qZiSwNVOCm5bwmWcO0LI7rmF9JNPMxJfHppQ0gudUjv1IX6s7X9SsfgUuna6FPXfXXWjF+TJvrLzmbGCZW5gOE0/FsiVSoUMyhnOd2Ald5qCVLhB4Okx9ov3ykaYP560qPiQuchCy/c14eo8CRTZfvwyATYCNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ob8y+cQ3; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4256866958bso741539f8f.1
        for <linux-leds@vger.kernel.org>; Thu, 16 Oct 2025 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760640824; x=1761245624; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/mqzXmAQ50Rc5bcmH208zXLpg7zAZdmyFj4xDWg5G6o=;
        b=Ob8y+cQ30H8b+jWYxzJTpgnB/qP0OHDtMWhYkaVWjKQX44L3Z6Mfusc7+L9bMU0P0/
         IvmblgLi9/w2fZlx9t5OiFnNxiaHn0fK/N/csZtnNWOuTsOa94DoTimLIPZWQSUeFvks
         +1wWhZSH4OZEireqBt/8+Vgznbo5nK8+L3Hvdz7zwslvlZWx4o09gAOJobTUvhFRD0S7
         0EHIcYhU50LctxLw4Lj8zgtoV4DsiiEfwBAkb1TJSC3MhReu0uztF0EdW8mdG9HG2na2
         0jNfp9NDIOa3L4X5nvOgPmcou/ceYfODWpvJL0hNb5xiOm2i+5rTZmk22u3gOEHZ1Y08
         PxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760640824; x=1761245624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/mqzXmAQ50Rc5bcmH208zXLpg7zAZdmyFj4xDWg5G6o=;
        b=jNuormMzQROrIHNf40eSDAXTS9Z/vijv9U9CuzB2pX4EnahAEGAXtHCRjnuXJ+urwu
         NsmwHFd7JziUuMYBJSpasSOGxcUczln0gOXLsNazARhX4zSFWwibdVNWUTKj9chJqoEi
         RWlVU+gC3eVoDkjq5yduy4O1D3Ue5esevuB1o+lfy+CTgU4X45xdyLQwB9Uxio/fInuJ
         bnoRW47oRJ0UaGM7aMPFmgqlOTXfgwjNbw9CbCkc4WJN8H+YGv2xtUeQybGjBZjoUjk7
         U8UVat27+Gb6mpIwpfCsN6VxaiMoNDlF1OAemWmaDGwoaQcuwi1E4wqaRD0CFb5KYug0
         tTIA==
X-Forwarded-Encrypted: i=1; AJvYcCUhdMO+/SfJeWf2kGi6AQ60mbO0FT1XKhLVTHJVcbkfY2O7t6bidBuOXOvHnNO4Aj2RyaUHaFrXOoVi@vger.kernel.org
X-Gm-Message-State: AOJu0YyrVNSsGdogzu71oK82iYv4Pn4MOsckaIUnZT6jgkhlAT4to5Au
	IMjOyzugAgdIa4o7XmkPRRH0bz+/vwP+KCy9/RmGgl6k/o+AdEIBOV5Rld3ZGYljN3IGDNE5fqS
	PIwKRK0bAFVROGedTC1X6v6Cl6el5aj3wX+Yk
X-Gm-Gg: ASbGncspVEBUDszlXz8hqGt+ROAMD+1Mtz9evIsjl2hTM53tzwnCTCNNOzyvrIM7Irm
	F9ki07tsnOdKKVPHtAb8JGUdR3MbKEXDIuYnJg9DYvRA1r+G5y6kCR+QLwSY1qB1ST3i0Jj8o6n
	h9P1ORGQj4DUtmsFnpyKxI87OhGCdr2TiMQQ+ypeT8doOyJv/yBqHT5p/a6H/K4b6kNEZObSc5f
	3flJOjNAxl2ypxGzeJMU+fAE/ZjhotBpdxNbYFFBNy7gkdVFdH94gYx3VN9oGIwjp4O/1kbr02h
	ko1b4Bt40WHBxIE17CtPJoZWsrnoLg==
X-Google-Smtp-Source: AGHT+IHhdgclFdo/jd6bons/G8sScySn6wGDuS6vqOFInfkOckOnahc3Uha5R92s3rwwgaWDN2XM43s6dNdaIy1xYhY=
X-Received: by 2002:a05:6000:2309:b0:426:d301:a501 with SMTP id
 ffacd0b85a97d-42704ded9d8mr719367f8f.62.1760640823754; Thu, 16 Oct 2025
 11:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210601005155.27997-1-kabel@kernel.org> <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
In-Reply-To: <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Oct 2025 19:53:17 +0100
X-Gm-Features: AS18NWBfdkOYg0lWdUnzcKi5SK2B8n5vdgUohorTtHmKCqbaebeIlifqCtH2bR0
Message-ID: <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
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

On Thu, Oct 16, 2025 at 2:14=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Marek Beh=C3=BAn (10):
> > >   leds: trigger: netdev: don't explicitly zero kzalloced data
> > >   leds: trigger: add API for HW offloading of triggers
> > >   leds: trigger: netdev: move trigger data structure to global includ=
e
> > >     dir
> > >   leds: trigger: netdev: support HW offloading
> > >   leds: trigger: netdev: change spinlock to mutex
> > >   leds: core: inform trigger that it's deactivation is due to LED
> > >     removal
> > >   leds: turris-omnia: refactor sw mode setting code into separate
> > >     function
> > >   leds: turris-omnia: refactor brightness setting function
> > >   leds: turris-omnia: initialize each multicolor LED to white color
> > >   leds: turris-omnia: support offloading netdev trigger for WAN LED
> > >
> > Do you plan to progress with the above series anytime soon? If not I
> > want to give this patch [0] again a respin.
>
> What features are you missing from the current kernel code, which this
> series adds?
>
I=E2=80=99m working on a platform that uses the VSC8541 PHY. On this platfo=
rm,
LED0 and LED1 are connected to the external connector, and LED1 is
also connected to the Ethernet switch to indicate the PHY link status.
As a result, whenever there is link activity, the PHY link status
signal to the switch toggles, causing the switch to incorrectly detect
the link as going up and down.

Cheers,
Prabhakar

