Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5B293E7D72
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 18:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234364AbhHJQYi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 12:24:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:44984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233981AbhHJQYg (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Aug 2021 12:24:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DB0F360ED8;
        Tue, 10 Aug 2021 16:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628612654;
        bh=YVP2aA9Rcgj+1n38xxAGC7IEGedz+70yPRyNqIvJCr8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jp19FBkdMf4JmElg5sQTh1JVQqki/FaL20o92O595x81oEXNJinE84sI59c8L2NEK
         QldbcPXnVhztQjCf/2cQ9VaU9yKKoAPs1svF3V4yl4xli3H9hnAPsMTs7JlIKZxjRR
         tr6hRpQbK+ERwT06PhY/YoSBxfiRJt8xmneCfgZY=
Date:   Tue, 10 Aug 2021 18:24:12 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, axboe@kernel.dk,
        kernelnewbies@kernelnewbies.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, pavel@ucw.cz, pali@kernel.org,
        hch@lst.de, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <YRKoLBigjbOb/iLa@kroah.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809205633.4300bbea@thinkpad>
 <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
 <20210810004331.0f0094a5@thinkpad>
 <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
 <YRIeHH1SLl6tYCeY@kroah.com>
 <20210810153840.42419d06@thinkpad>
 <YRKRpQdLRJmAb5kZ@kroah.com>
 <b8e99efb-7385-0ca2-641c-f93006b20527@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8e99efb-7385-0ca2-641c-f93006b20527@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Aug 10, 2021 at 10:55:33AM -0500, Ian Pilcher wrote:
> On 8/10/21 9:48 AM, Greg KH wrote:
> > But what about when the device is removed from the system first?  Be
> > careful about that...
> > 
> > Anyway, sure, try those functions, I really do not know, all I
> > originally complained about was those exports which did not need to be
> > exported.
> 
> Sounds good.  I'll work something up.  (I'm actually thinking that
> class_find_device() may be the best way to go, as it grabs a reference
> to the device.)

There should not be anything "odd" about block devices here, just do
whatever all other LED drivers do when referencing a device.

thanks,

greg k-h
