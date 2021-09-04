Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746A84009ED
	for <lists+linux-leds@lfdr.de>; Sat,  4 Sep 2021 07:57:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhIDF6s (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 4 Sep 2021 01:58:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:57740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229741AbhIDF6r (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 4 Sep 2021 01:58:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63B2D60FDC;
        Sat,  4 Sep 2021 05:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630735066;
        bh=nD1U32S6Fzmo+zWbyEBE9TDhzXdf4QJPCcjsoZxAAz4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Qe7yXkuDBoCngCTKE6eimmDfTVsxiZur5cpgfXcGFgi7oren5PBYjsvJmGRXmmSs3
         1NFBUsEjpLlvVvLu0szXiogdxqRHKDT12jOG44fCcpebLnGoCaPPqmC7x846phff3L
         ydAcssnRfBEXdHPWkJcd7nxS3loLFVv1QDbu2W5s=
Date:   Sat, 4 Sep 2021 07:57:44 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux@vger.kernel.org,
        kabel@kernel.org
Subject: Re: [PATCH 15/18] ledtrig-blkdev: Add sysfs attributes to [un]link
 LEDs & devices
Message-ID: <YTMK2F664Gi+Xc3i@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-16-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210903204548.2745354-16-arequipeno@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Sep 03, 2021 at 03:45:45PM -0500, Ian Pilcher wrote:
> /sys/class/leds/<led>/add_blkdev - to create device/LED associations
> 
> /sys/class/leds/<led>/delete_blkdev to remove device/LED associations
> 
> For both attributes, accept multiple device names separated by whitespace
> 
> Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
> ---
>  drivers/leds/trigger/ledtrig-blkdev.c | 48 +++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)

Where are the Documentation/ABI/ updates for these new sysfs files?

thanks,

greg k-h
