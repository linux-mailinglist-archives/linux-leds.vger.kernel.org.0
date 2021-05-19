Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C73B3888E9
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 10:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243794AbhESIER (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 04:04:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:47078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242061AbhESIEQ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 04:04:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 503EE611BF;
        Wed, 19 May 2021 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621411377;
        bh=Aeko/3tsOwpiZC8fRlq4sInIE8imT0nQuJbt8oMRw0o=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=poO7BaIgO/F38OgxdbSS4K3qO9DvAXNrZONb/1tK7HG35jyxNV78WyO/EeYFOE2tm
         akRUKx4sNOCpEQa2VnbT19GRbhLK3FidLJ1hskteFESbR80XvYW7dcrwZ7jxNSwQ9x
         zap2KMvkWeT+ZmvDs05kiBL/ZAx3rTBZKLvXxDdyIsaHvn2Z5T/S0zhC6+B+IIIWMe
         zaYSinR52s3bjo5KsJ0e4aMzvi33V4jSYS7j3bp/rmOfur9wIgTAmK0xYwtaxmlWj3
         k2CKeJSNhEM2zrW2zelPXuEEObFlqMNIUSxr6kuXjjKgWGDh3RHJWNapv8Eq+WXjl7
         jYW639xTs06ag==
Date:   Wed, 19 May 2021 10:02:53 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210519100253.49b155e9@thinkpad>
In-Reply-To: <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

What possible configurations does this support?

Does this blink on rx/tx activity for a specific ethernet port?

There is a work in progress to add support for transparent offloading of
LED triggers, with the netdev trigger being the first target.

This means that after that is done, you could implement this driver so
that when netdev trigger is enabled on a supported interface, your
driver will offload the blinking to the HW.

This should probably also work for HDD activity, but this would need a
blockdev trigger first...

Marek
