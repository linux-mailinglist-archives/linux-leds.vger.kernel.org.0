Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB8740106B
	for <lists+linux-leds@lfdr.de>; Sun,  5 Sep 2021 16:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235218AbhIEOw6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Sep 2021 10:52:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:58542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229566AbhIEOw6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 5 Sep 2021 10:52:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 981BC60EE1;
        Sun,  5 Sep 2021 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1630853515;
        bh=GUIXDK0T/+gzxVBPErbEWyDKOaDI99BmVINimwHsAt0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qRpVhWVdzXG0u+f7bBqzFWAPc4ncra5JJk7mv2t7oKnwjb4M2GukqgfB2n9MjtwWf
         hYFzlTuVUabiIGfPaGa76dOeNzVWjNW5c1l24on8DkX8ZQY4GGs+f5zeWQ3hzFn8x5
         fr6DjHEYTWKnfd84lI7OXCgodEmxIDz6XJZ9pEE8=
Date:   Sun, 5 Sep 2021 16:51:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, kabel@kernel.org
Subject: Re: [PATCH 09/18] ledtrig-blkdev: Periodically check devices for
 activity & blink LEDs
Message-ID: <YTTZiBWz0Rc7+IGZ@kroah.com>
References: <20210903204548.2745354-1-arequipeno@gmail.com>
 <20210903204548.2745354-10-arequipeno@gmail.com>
 <YTMLxdQ3TFKPN+WH@kroah.com>
 <8b0a2244-d81c-1099-927f-cfe9b04a4285@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0a2244-d81c-1099-927f-cfe9b04a4285@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 05, 2021 at 09:39:57AM -0500, Ian Pilcher wrote:
> On 9/4/21 1:01 AM, Greg KH wrote:
> > Please never use WARN_ON() in new code unless the machine is really
> > broken and you can not do anything else here.
> 
> Wait what?  I thought that was BUG_ON.

Not whan panic-on-warn is set, which is getting more and more common
these days.

thanks,

greg k-h
