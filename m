Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A1F3E7D9F
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 18:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235455AbhHJQjr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 12:39:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:52086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230410AbhHJQjr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Aug 2021 12:39:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08A1060041;
        Tue, 10 Aug 2021 16:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628613564;
        bh=pt+PGt+C0GTfdvz8hMl07lVk7abqx9GVd6wHBkWheks=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=JR/2Y3bxYSVRYUtQwOGCrm/2nlqFhjOtGgKu/oL1OUrPgIb4GpT/TzgjqiSBiH5gf
         O6HvlD+IvCE918VV8+kVv+9HsHIAtWXJ1jMpvZ0duFderkNjsQaCwiHq2mVJ2nKZ3M
         qgHT4+HnWSEFHg5iV2zOKrTzBOeX6esNG6gNCMSlUQtiZB29f8a4kHLWFi8sOXQ2W0
         euOXF0shsKmLG68AEwdXyRLZLEzcKm+SJvfPfFPy6BL5g0Kl7fGCl3zPCJPeuQAr0I
         nFeIDzZZblpxjoSwbtUhxF2293qXaZZm0yBUPxFJRGeotRA0iBBUYEpgWk8rBztOHJ
         uK2z8jHKPdv4w==
Date:   Tue, 10 Aug 2021 18:39:14 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, axboe@kernel.dk,
        kernelnewbies@kernelnewbies.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, pavel@ucw.cz, pali@kernel.org,
        hch@lst.de, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <20210810183914.47727056@thinkpad>
In-Reply-To: <YRKoLBigjbOb/iLa@kroah.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
        <20210809205633.4300bbea@thinkpad>
        <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
        <20210810004331.0f0094a5@thinkpad>
        <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
        <YRIeHH1SLl6tYCeY@kroah.com>
        <20210810153840.42419d06@thinkpad>
        <YRKRpQdLRJmAb5kZ@kroah.com>
        <b8e99efb-7385-0ca2-641c-f93006b20527@gmail.com>
        <YRKoLBigjbOb/iLa@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 10 Aug 2021 18:24:12 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> > Sounds good.  I'll work something up.  (I'm actually thinking that
> > class_find_device() may be the best way to go, as it grabs a reference
> > to the device.)  
> 
> There should not be anything "odd" about block devices here, just do
> whatever all other LED drivers do when referencing a device.

Ian, look at ledtrig-tty and maybe get inspiration from there :)

Marek
