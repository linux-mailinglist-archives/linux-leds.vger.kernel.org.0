Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85AAA406E01
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 17:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234247AbhIJPN0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 10 Sep 2021 11:13:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:46326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234173AbhIJPN0 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 10 Sep 2021 11:13:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC73260C40;
        Fri, 10 Sep 2021 15:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631286735;
        bh=LSRQz6T2RqWRHMnOsj1xIbun3ED++BM0Nh4W9dbINpw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=PdFWexZRH1uFhUR7IZFejc/blWACrb+TkCGfyPwr6t/71LapGRstvVhnjHndIQ6Ft
         rtGi/23EBiGwpvk648rxz/WeAqV7P7GQd2kTJvXcX25br3Sq1moF2MeuXoTZXY0X2b
         E48V8G+ZCywNMEdYCggTLC7WryIB+tIuKZ9fNuebfsy5FvnGciNDtgENCsBJxaJJHu
         hAs6tTA5e01TcqLlwzaq1J6qk9XDqfA7/YS4FzIW1w1GdLbQLtBQPHWi9pyyazEbav
         jovLoB9gREnFSCS2Hf2vtCDU2bKtXrraou6pMjSnyjyVXoI/DvrwAiJLq0cmZuyOCD
         8k22JKWArwmDA==
Date:   Fri, 10 Sep 2021 17:12:11 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 09/15] leds: trigger: blkdev: Check devices for
 activity and blink LEDs
Message-ID: <20210910171211.3c2236c3@thinkpad>
In-Reply-To: <77111c57-dfb5-44c6-c4e9-e18afb468b6e@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
        <20210909222513.2184795-10-arequipeno@gmail.com>
        <20210910041713.4722760a@thinkpad>
        <77111c57-dfb5-44c6-c4e9-e18afb468b6e@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 10 Sep 2021 10:09:09 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> On 9/9/21 9:17 PM, Marek Beh=C3=BAn wrote:
> > So your code allows me to use a partition block device (like sda2) to
> > register with the blkdev LED trigger, but when I do this, the code will
> > disregard that I just want the LED to blink on activity on that one
> > partition. Instead you will blink for whole sda, since you are looking
> > at stats of only part0.
> >=20
> > Am I right? =20
>=20
> You can't add partitions, only whole devices.

But I should be able to, since partition is a block device in /dev.
Any block device from /sys/class/block should be possible to add.

Marek
