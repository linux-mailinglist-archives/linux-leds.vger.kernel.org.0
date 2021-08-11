Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1722B3E8F06
	for <lists+linux-leds@lfdr.de>; Wed, 11 Aug 2021 12:51:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237181AbhHKKvk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Aug 2021 06:51:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:35954 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237180AbhHKKvj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 11 Aug 2021 06:51:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5157B60E78;
        Wed, 11 Aug 2021 10:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628679076;
        bh=rH5YRaOaWyAR5nRm148pL736R8MucsTyJdvhBT11OlI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m7xjOa9y9J0xdu2uxFHvu2u5VOkNGxjIhzSUYBCzqjKIjFqxGuiAwMZqh2f98WFUL
         zp/7IaiGIy05+GMRATbgq4gW1dAKfGM40EA+YYbNuUv1ze/FivFhau/zYbQalQOs8D
         4C1g1QVH6XiJeMuUbFlXxdBI9bCFs+OP5P4YmUd19VdNWf5rHSmowyakGLoqrGzGXy
         Hcm65dJKrqPHXuTlDe6Ky+2UHhHz7EM5yFl9a3OsIJdckrp7bbG/FbwXJHwsKTWcub
         zWvBnRfrmQo9yETjkAeKe/4v4gg3ok4tFaTqqQTlik7tUz/c6TnJrHmGAGEnUjAB48
         EhB2MzyKb32eQ==
Date:   Wed, 11 Aug 2021 12:50:48 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Ian Pilcher <arequipeno@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>, pali@kernel.org,
        linux-block@vger.kernel.org, linux-leds@vger.kernel.org,
        axboe@kernel.dk, pavel@ucw.cz, linux-kernel@vger.kernel.org,
        kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <20210811125048.3bbcebdb@thinkpad>
In-Reply-To: <20210811062642.GA3119@lst.de>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
        <20210809205633.4300bbea@thinkpad>
        <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
        <20210810004331.0f0094a5@thinkpad>
        <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
        <20210811062642.GA3119@lst.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 11 Aug 2021 08:26:42 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Mon, Aug 09, 2021 at 06:50:44PM -0500, Ian Pilcher wrote:
> > On 8/9/21 5:43 PM, Marek Beh=C3=BAn wrote: =20
> >> I confess that I am not very familiar with internal blkdev API. =20
> >
> > It's mainly a matter of symbol visibility.  See this thread from a few
> > months ago:
> >
> >   https://www.spinics.net/lists/linux-leds/msg18244.html
> >
> > Now ... my code currently lives in block/, so there isn't actually
> > anything technically preventing it from iterating through the block
> > devices.
> >
> > The reactions to Enzo's patch (which you can see in that thread) make me
> > think that anything that iterates through all block devices is likely to
> > be rejected, but maybe I'm reading too much into it. =20
>=20
> I think the main issue with this series is that it adds a shitload of
> code and a hook in the absolute I/O fastpath for fricking blinkenlights.
> I don't think it is even worth wasting time on something this ridiculous.

That's why I think we should do this the way the netdev trigger does.
Periodically reading block_device's stats, and if they are greater,
blink the LED.

Marek
