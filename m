Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1A08406584
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 04:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhIJCLO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 22:11:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229524AbhIJCLN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 22:11:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C7E6610E8;
        Fri, 10 Sep 2021 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631239803;
        bh=14On0rcaDezxbH9UPvQ6IzG/K0p2ja5CEwdNBBTMIbA=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=W/xZGTf7eknCyaup/1kGx7lADH0Ux1yFiR9+NcWrwjqFzi9IfuZsPqAVueSnkUwV9
         Dfezlg+k8THQILM5fOP4ifMkEMnU1G34qEjwOa3TirsM4HH0coRDNbxHPlWYLzQwnW
         vyW4TfkRbJvtLxBfKQu8KzGTI5rVRBuscSBElQkk5qGmYduj7j/f0GjuWkG/gmDllQ
         G+Pod8NRnpmwCNnAZWlLwu1d2G4alJZ5+pRS2R+q28/D4k5TaPwOGVq4fqttmJw1fC
         O1AXW7piiQC8gupLpmbMyalvRkiKA2BwIeCH4PQ5P5p4uV4eGkfWmib4w1/HhQeC+y
         SvkPZv7AiljsA==
Date:   Fri, 10 Sep 2021 04:09:59 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Ian Pilcher <arequipeno@gmail.com>
Cc:     axboe@kernel.dk, pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 00/15] Introduce block device LED trigger
Message-ID: <20210910040959.5ae4a6a1@thinkpad>
In-Reply-To: <20210909222513.2184795-1-arequipeno@gmail.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Dear Ian,

I have tried to look into this and replied to some of your patches.

There are still many things to do, and I think the reviewing would be
much easier to review if you sent all the code changes as one patch
(since the changes are doing an atomic change: adding support for blkdev
LED trigger). Keep only the sysfs doc change in a separate patch.

You are unnecessary using the const keyword in places where it is not
needed and not customary for Linux kernel codebase. See in another of
my replies.

You are using a weird comment style, i.e.
  /*
   *
   *	Disassociate an LED from the trigger
   *
   */

  static void blkdev_deactivate(struct led_classdev *const led_dev)

Please look at how functions are documented in led-class.c, for example.

There are many other things I would like you to change and fix,
I will comment on them once you send this proposal as two commits:
one sysfs docs change, one code change.

Marek
