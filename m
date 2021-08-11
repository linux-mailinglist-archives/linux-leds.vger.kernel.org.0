Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBD43E8A30
	for <lists+linux-leds@lfdr.de>; Wed, 11 Aug 2021 08:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234674AbhHKG1J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Aug 2021 02:27:09 -0400
Received: from verein.lst.de ([213.95.11.211]:39257 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234575AbhHKG1J (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Aug 2021 02:27:09 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id AE39F6736F; Wed, 11 Aug 2021 08:26:42 +0200 (CEST)
Date:   Wed, 11 Aug 2021 08:26:42 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>, hch@lst.de,
        pali@kernel.org, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, axboe@kernel.dk, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <20210811062642.GA3119@lst.de>
References: <20210809033217.1113444-1-arequipeno@gmail.com> <20210809205633.4300bbea@thinkpad> <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com> <20210810004331.0f0094a5@thinkpad> <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Aug 09, 2021 at 06:50:44PM -0500, Ian Pilcher wrote:
> On 8/9/21 5:43 PM, Marek Behún wrote:
>> I confess that I am not very familiar with internal blkdev API.
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

I think the main issue with this series is that it adds a shitload of
code and a hook in the absolute I/O fastpath for fricking blinkenlights.
I don't think it is even worth wasting time on something this ridiculous.
