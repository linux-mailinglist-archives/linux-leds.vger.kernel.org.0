Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3CD40651C
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 03:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235663AbhIJBYm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 21:24:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235891AbhIJBYe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 21:24:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83B0661132;
        Fri, 10 Sep 2021 01:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631237004;
        bh=bjv0+sDIcnJr3f5g4ivAnJlrxprFxDeF0YUsUjc9uPA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DtsqBhaT2vXKmR/ISV6bH08y38BrFh4PQUOIC3c+i9nVtPOM489gwLPmGJxuIrlVm
         8w+pQu4y6opyuY5dUSewKH2uIu84B+2bX04+yz9RC/b8I1hErGgPKWSv/nmhr2KIy+
         FIhjF/nS9lPrJr0Pe0grMaXfSiOwT2SM7KgePu5e95bilX+sLWnbJrze4l7t2H9DOY
         Tv44EpZgyC6KZZ48OqgTfZzCxwbZeLPDOUp5rcpE4lfKw2RP7V+DyGJ6CHOA/ATC51
         7msxyoToe812/36TLklOneO6UyS9yrlcKGgJgX9iNYby5hlDwSF0qa16Z9mRzQXQv3
         Za1vNwYjvYN6A==
Date:   Fri, 10 Sep 2021 03:23:19 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 04/15] block: Add block device LED trigger
 integrations
Message-ID: <20210910032319.71b843d7@thinkpad>
In-Reply-To: <20210909222513.2184795-5-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
        <20210909222513.2184795-5-arequipeno@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu,  9 Sep 2021 17:25:02 -0500
Ian Pilcher <arequipeno@gmail.com> wrote:

> Add LED trigger disk info pointer to gendisk structure
> 
> Call ledtrig_blkdev_disk_init() from device_add_disk() to ensure that
> ledtrig is initialized to NULL, in case a driver allocates the structure
> itself and doesn't use kzalloc()

No, this is not needed. If someone does not use kzalloc(), they should
use it. No need to fix other code here.

Marek
