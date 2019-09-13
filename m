Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3194AB17D8
	for <lists+linux-leds@lfdr.de>; Fri, 13 Sep 2019 07:00:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727287AbfIMFAr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 Sep 2019 01:00:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:45158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725385AbfIMFAr (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 13 Sep 2019 01:00:47 -0400
Received: from localhost (unknown [84.241.200.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A51BC20717;
        Fri, 13 Sep 2019 05:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568350846;
        bh=LeRx+cndhezVjHskjesegzB27dXDHsKW88TsSEQXbh8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gZksLgExUbJGnZXnCiCLnMV2KhUQXmMgJbe3oc4oByGkAPVDTrIdp3pt5Gg8LgKFV
         e5UDQmgruavnqC5KLAXYR3kIYLeKbrH6Te7yQXlEa/V6z17IzCS8omqRpnaeyUgPvr
         iaJPlDyEQ3ENJRg4YM+C7kwrJGR7w0b79p3DlWpM=
Date:   Fri, 13 Sep 2019 06:00:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Akinobu Mita <akinobu.mita@gmail.com>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
Message-ID: <20190913050042.GC128462@kroah.com>
References: <1568299189-11074-1-git-send-email-akinobu.mita@gmail.com>
 <1568299189-11074-2-git-send-email-akinobu.mita@gmail.com>
 <296db773-2185-9a5e-c9e6-df614092a969@gmail.com>
 <CAC5umygmcVwbksX3t2bgvvcSztaeAw9MnEj_=HgZK+C8Wc5_NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC5umygmcVwbksX3t2bgvvcSztaeAw9MnEj_=HgZK+C8Wc5_NA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 13, 2019 at 09:34:49AM +0900, Akinobu Mita wrote:
> 2019年9月13日(金) 2:15 Jacek Anaszewski <jacek.anaszewski@gmail.com>:
> >
> > Hi Akinobu,
> >
> > Please bump patch version each time you send an update
> > of the patch with the same subject.
> 
> Oops, should I resend with the correct subject?

Yes please.
