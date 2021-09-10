Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55652406538
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 03:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230496AbhIJBd4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 21:33:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:51474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230487AbhIJBdz (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 21:33:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 03E9E61167;
        Fri, 10 Sep 2021 01:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631237565;
        bh=gXveKeTWNExVQFgjnaiJLlZAeV+wFFV1ElNwTuB3Kc8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=CABSVTxn5GN9KiqlpXGZOHbnHIVjbQiU1s74N42eUu+0fx8ExIp0wKRWg/5tFMSVO
         VZuBGwC3EgZlv72wCo5SxCU9c77FbQYAtGyjZlHnDGI8puTBKh3rQyfzRjT1V7fKar
         e4oXAgz9aLHRgCbgzMSNm6S7tkg91g4W0C519BaHtM7kYLjyqvYHqNdrxXR3n/b33x
         5TxlVeEN7vWPcFqKy33bXdnGghNc78mokhDJkFxZyVLJXbw9Or61R3Q5p8LcSs+HfB
         C+Ib/uVUs2OR2Kdo71GwXSQZPxthhPy9I5LeQsG6b1pgXNaLvmMW1Ba1TA4Ed7P7PC
         GBo/1h6aXxuUw==
Date:   Fri, 10 Sep 2021 03:32:40 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 02/15] leds: trigger: blkdev: Add build
 infrastructure
Message-ID: <20210910033240.581ebcea@thinkpad>
In-Reply-To: <20210909222513.2184795-3-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
        <20210909222513.2184795-3-arequipeno@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu,  9 Sep 2021 17:25:00 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> Add files:
>   * ledtrig-blkdev-core.c - trigger components that are always built-in
>   * ledtrig-blkdev.c - trigger components that can be built as a module
>   * ledtrig-blkdev.h - common declarations

I have never seen this done this way. Add new files once you have
content for them. I think this entire proposal should be done as one
patch, since it atomically adds functionality.

Now I have to jump between various e-mail when I want to create a mind
map of what this code is doing, and it is annoying.

Please resend this as:
 - one patch adding sysfs docs
 - one patch for the rest

Marek
