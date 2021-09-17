Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE9540F236
	for <lists+linux-leds@lfdr.de>; Fri, 17 Sep 2021 08:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhIQGU7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 17 Sep 2021 02:20:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:37424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229474AbhIQGU7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 17 Sep 2021 02:20:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63D7860F4A;
        Fri, 17 Sep 2021 06:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631859578;
        bh=7B19B2u7KI/KH2szdmZ7KLoFLNBJ5cJv1+OPrH1BT2I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dOVEen7O1CGABMmrKYRK5gi+DmPgdliF5LpLjyMDGEtSIj2A+nOooiU0AZxIPb5Gf
         IA8FGXFAQaTiR4oS8mM9Bn0E7uLB5UO+90zdMSoIVU/zYJcDnOe4+//Uw1vdPU9HoQ
         dFFFp++COcUttzWj4ZHe2zcSvZOP26DNPFZmzQKY=
Date:   Fri, 17 Sep 2021 08:19:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kabel@kernel.org
Subject: Re: [PATCH v4 1/2] docs: Add block device (blkdev) LED trigger
 documentation
Message-ID: <YUQzdyG+WWoiJ2I9@kroah.com>
References: <20210916202127.1216994-1-arequipeno@gmail.com>
 <20210916202127.1216994-2-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210916202127.1216994-2-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Sep 16, 2021 at 03:21:26PM -0500, Ian Pilcher wrote:
> +What:		/sys/class/leds/<led>/link_device
> +Date:		September 2021
> +Contact:	Ian Pilcher <arequipeno@gmail.com>
> +Description:
> +		Associate a block device with this LED by writing the path to
> +		the device special file (e.g. /dev/sda) to this attribute.
> +		Symbolic links are followed.  Optionally, the leading "/dev/"
> +		may be omitted.

No, please don't follow symlinks, stick with kernel names here,
otherwise you have a mismatch between that and the list of devices in
this file:

> +What:		/sys/class/leds/<led>/linked_devices

thanks,

greg k-h
