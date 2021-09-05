Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B6A7401079
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 17:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhIEPNo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 11:13:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:34292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhIEPNo (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 5 Sep 2021 11:13:44 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFEBB60C51;
        Sun,  5 Sep 2021 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630854761;
        bh=EJKtfZlvYjyzvF8xbB3qZsOcfE6aKYDONOl+sB/n6rU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=2J0mnQMWIP0vwLBumtXea0Li6OBlqYbbFPHoPECQTbINXR5uBnR/oG0XLztJ4NzH3
         TS66pj8FyXv+P6HVYNReaHE1t2FxzNgRIRDBLjwi+ltnx36Yyv01Fi85ai+fNHokOi
         4DZrnowJ5+P0v3RjwxqTReJ5lVE013PEPJ6nMpcA=
Date:   Sun, 5 Sep 2021 17:12:39 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
Subject: Re: [PATCH 09/18] ledtrig-blkdev: Periodically check devices for
 activity & blink LEDs
Message-ID: <YTTeZ1kSQMRZNpz7@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-10-arequipeno@gmail.com>
 <YTMLxdQ3TFKPN+WH@kroah.com>
 <8b0a2244-d81c-1099-927f-cfe9b04a4285@gmail.com>
 <YTTZiBWz0Rc7+IGZ@kroah.com>
 <cf19e61d-97a6-1463-3072-d3527d8a1e3a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf19e61d-97a6-1463-3072-d3527d8a1e3a@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 05, 2021 at 09:56:58AM -0500, Ian Pilcher wrote:
> On 9/5/21 9:51 AM, Greg KH wrote:
> > On Sun, Sep 05, 2021 at 09:39:57AM -0500, Ian Pilcher wrote:
> > > On 9/4/21 1:01 AM, Greg KH wrote:
> > > > Please never use WARN_ON() in new code unless the machine is really
> > > > broken and you can not do anything else here.
> > > 
> > > Wait what?  I thought that was BUG_ON.
> > 
> > Not whan panic-on-warn is set, which is getting more and more common
> > these days.
> 
> Fair enough.  What is the recommend approach to reporting a "this should
> never" happen situation these days?

dev_err() and handle the error properly.


