Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B8343E5BF1
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 15:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241650AbhHJNkO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Aug 2021 09:40:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:49392 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241877AbhHJNji (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Aug 2021 09:39:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD75E60EE7;
        Tue, 10 Aug 2021 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628602749;
        bh=fObxAgs+ulfRDwt7g5xTa8zsugCY1+6fJfkNM/IsNlA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rL/ZttqfxsO2dZRUHtzy9nzwGGoLFagpqaqSVFKyYkmwEk8jLLj+VGms3FbxODWOE
         /axtGd5S9x+7lkyR5olgKW/uQ6xIG4FAyY22EBUvi0ygIQI/V8oqo0AztKG0xH8P+D
         i2BUBtwAKuoo5FiwRcNTvRRH5OPAvTRFsERhYmH3cPbkdyodLTyF6MqRFOB3VOotNS
         EgJsbqMLwqFLTVqbYkoNJRWhI2ATN7S7OajsyTWegqHLoNNk3q1brbNti/WGlP5hLq
         Dtva7zVz02U1F7tX/hFspZj7RsQEplXREoFsMoN28qsjq+2ZvBsJ6Dl4XjCpPfWmew
         qK1BAfDETIcpw==
Date:   Tue, 10 Aug 2021 15:38:40 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Ian Pilcher <arequipeno@gmail.com>, hch@lst.de, axboe@kernel.dk,
        kernelnewbies@kernelnewbies.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, pavel@ucw.cz, pali@kernel.org,
        linux-leds@vger.kernel.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <20210810153840.42419d06@thinkpad>
In-Reply-To: <YRIeHH1SLl6tYCeY@kroah.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
        <20210809205633.4300bbea@thinkpad>
        <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
        <20210810004331.0f0094a5@thinkpad>
        <7b5f3509-5bcd-388b-8d3b-4ea95a9483ad@gmail.com>
        <YRIeHH1SLl6tYCeY@kroah.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 10 Aug 2021 08:35:08 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> On Mon, Aug 09, 2021 at 06:50:44PM -0500, Ian Pilcher wrote:
> > On 8/9/21 5:43 PM, Marek Beh=C3=BAn wrote: =20
> > > I confess that I am not very familiar with internal blkdev API. =20
> >=20
> > It's mainly a matter of symbol visibility.  See this thread from a few
> > months ago:
> >=20
> >   https://www.spinics.net/lists/linux-leds/msg18244.html
> >=20
> > Now ... my code currently lives in block/, so there isn't actually
> > anything technically preventing it from iterating through the block
> > devices.
> >=20
> > The reactions to Enzo's patch (which you can see in that thread) make me
> > think that anything that iterates through all block devices is likely to
> > be rejected, but maybe I'm reading too much into it.
> >=20
> >=20
> > Greg / Christoph -
> >=20
> > (As you were the people who expressed disapproval of Enzo's patch to
> > export block_class and disk_type ...)
> >=20
> > Can you weigh in on the acceptability of iterating through the block
> > devices (searching by name) from LED trigger code within the block
> > subsystem (i.e. no new symbols would need to be exported)?
> >=20
> > This would allow the trigger to implement the sysfs API that Marek and
> > Pavel want. =20
>=20
> No idea, let's see the change first, we can never promise anything :)

Hi Greg,

Can't we use blkdev_get_by_path() (or blk_lookup_devt() with
blkdev_get_by_dev())?
This would open the block device and return a struct block_device *.
When the LED trigger is disabled, it would also have to release the
device.

Marek
