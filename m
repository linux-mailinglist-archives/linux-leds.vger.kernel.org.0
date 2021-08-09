Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABA5D3E4F6C
	for <lists+linux-leds@lfdr.de>; Tue, 10 Aug 2021 00:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234638AbhHIWoD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 18:44:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:47846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230138AbhHIWoC (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Aug 2021 18:44:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C053F60F8F;
        Mon,  9 Aug 2021 22:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628549021;
        bh=/kit/4kBgb+oc/UK+zBg9kJTOAB/mp3ogaP/yVFr32Y=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=BinE8AMs4Dr3kN/51LsD2TgouGZP/JLP1K14sspnCv5WT8NVf2KfeCysCJA3Sjam/
         smpp88csaLggnTb1hK5xAjTU202B+tPv6cTin2/pbKi9OOsOrMRReqCOzVAnxGGd84
         js5BuF4ZFZd/RTQG6bLrznYkgMACxWjV0oJsJ/aprSZVVRnBrBZIBP9+BR4RGONGlh
         AFoiSXqYZbleWCwi53ngsKrdGdAWnJGmse4sV37p0KoKf2zJS/+5IX5nP0Wacx10jb
         jduqkdvXWaSRosK1W+8awAItT8VzXzXfmR8E2HC22nrtpjyja+NNu9t77LBJulxgiF
         0fSZ/3oupYYTQ==
Date:   Tue, 10 Aug 2021 00:43:31 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     pali@kernel.org, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, axboe@kernel.dk, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <20210810004331.0f0094a5@thinkpad>
In-Reply-To: <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
        <20210809205633.4300bbea@thinkpad>
        <81c128a1-c1b8-0f1e-a77b-6704bade26c0@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 9 Aug 2021 14:54:26 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> I'm not unalterably opposed to the idea, but I don't currently see a way
> to do that without resolving block devices (struct gendisk) by name, and
> that seems to be a no-no.

So a name like "sda1" is not viable? Why? What about "MAJOR:MINOR"?

I confess that I am not very familiar with internal blkdev API.

Quick look reveals that there is a struct block_device, containing a
member bd_disk, which is a pointer to struct gendisk.

What is the relationship between these two? Can there be a block device
without a gendisk, for example?

Marek
