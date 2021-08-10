Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EC013E5393
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 08:35:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhHJGfd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 02:35:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:41574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhHJGfc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Aug 2021 02:35:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C56D60E9B;
        Tue, 10 Aug 2021 06:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628577311;
        bh=0MlOsZpdt27CjZT8u0hLWNXRbC0r9HoIooJxLpXDo1A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=113n+ktMggo1IETMY0vsNHitek+/+TYudU02iK5w/C0huVvKWgBCRyKlvjrhR1zsB
         ajT/vNC4ZJdnjQJG9Pdc+r7VnSHcR19ZKVM3+IYtn+uby0c266j8kcYOcrYUewTDqU
         05b4BrPq1nL6X4ZFSXQRYWifSbZAHUXbVFiB8erc=
Date:   Tue, 10 Aug 2021 08:35:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>, hch@lst.de,
        axboe@kernel.dk, kernelnewbies@kernelnewbies.org,
        linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
        pavel@ucw.cz, pali@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <YRIeHH1SLl6tYCeY@kroah.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809205633.4300bbea@thinkpad>
 <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
 <20210810004331.0f0094a5@thinkpad>
 <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Aug 09, 2021 at 06:50:44PM -0500, Ian Pilcher wrote:
> On 8/9/21 5:43 PM, Marek Behún wrote:
> > I confess that I am not very familiar with internal blkdev API.
> 
> It's mainly a matter of symbol visibility.  See this thread from a few
> months ago:
> 
>   https://www.spinics.net/lists/linux-leds/msg18244.html
> 
> Now ... my code currently lives in block/, so there isn't actually
> anything technically preventing it from iterating through the block
> devices.
> 
> The reactions to Enzo's patch (which you can see in that thread) make me
> think that anything that iterates through all block devices is likely to
> be rejected, but maybe I'm reading too much into it.
> 
> 
> Greg / Christoph -
> 
> (As you were the people who expressed disapproval of Enzo's patch to
> export block_class and disk_type ...)
> 
> Can you weigh in on the acceptability of iterating through the block
> devices (searching by name) from LED trigger code within the block
> subsystem (i.e. no new symbols would need to be exported)?
> 
> This would allow the trigger to implement the sysfs API that Marek and
> Pavel want.

No idea, let's see the change first, we can never promise anything :)

thanks,

greg k-h
