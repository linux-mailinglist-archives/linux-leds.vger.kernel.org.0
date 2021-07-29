Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 535663D9D47
	for <lists+linux-leds@lfdr.de>; Thu, 29 Jul 2021 07:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhG2Fyb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Jul 2021 01:54:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:59376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230223AbhG2Fyb (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Jul 2021 01:54:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D67A61053;
        Thu, 29 Jul 2021 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627538068;
        bh=rAXscKZrW+2+4LGOnZPqFBsItZBqoTEh6dVWtmRtH2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ppnf4cw4XG1iifQPDU9vTPsziBWEDfVakd1QzjJc7424WDvwxsarkQXBOSne6lZRX
         2LQTRfGte1ePbPnsuRNFBOPAGjCLDiW4aH1lspDeN3kcY1w1XQsvo64fyIaE7AJJzN
         hwQs8Gu2qqMdH6i2S4aDJtFdcovWFMFhZeSx/Iw0=
Date:   Thu, 29 Jul 2021 07:54:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, linux-kernel@vger.kernel.org, pavel@ucw.cz,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH 4/8] block: Add block class attributes to manage LED
 trigger list
Message-ID: <YQJCj/LjjCqb93AS@kroah.com>
References: <20210729015344.3366750-1-arequipeno@gmail.com>
 <20210729015344.3366750-5-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210729015344.3366750-5-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jul 28, 2021 at 08:53:40PM -0500, Ian Pilcher wrote:
> * New class attributes - /sys/class/block/led_trigger_{new,list,del}
> 
> * Add init function - blk_ledtrig_init() - to create the attributes
>   in sysfs.  Call blk_ledtrig_init() from genhd_device_init() (in
>   block/genhd.c).
> 
> * New file - block/blk-ledtrig.h

That is an odd way to write a changelog, please read the documentation
file about how to write a good changelog.

thanks,

greg k-h
