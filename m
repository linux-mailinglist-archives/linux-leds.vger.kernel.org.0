Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8893F63A8C
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2019 20:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727339AbfGISFI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Jul 2019 14:05:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:36308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727308AbfGISFH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 9 Jul 2019 14:05:07 -0400
Subject: Re: [GIT PULL] LED updates for 5.3-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562695507;
        bh=cho5xKoQ+OHVFvKDEWmUrfNzmzQzKJPJBdUaXIfCCYs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=HEt1ZLNABQQZvhApPiio0NHYUuEeWWFw5SypToFi0Wn/YO7cIGJMzez9XwyDmHJSO
         72euKh2ms/ABli/FDLukLSFjYUF/4ahfUQtn+Xah1IrCZhpU3nouMb4r4K8vntQjx1
         WVRsYV6mjOHYgnVEqQm8bRim66J+z14JPVtMQwjk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190701164633.6133-1-jacek.anaszewski@gmail.com>
References: <20190701164633.6133-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190701164633.6133-1-jacek.anaszewski@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 tags/leds-for-5.3-rc1
X-PR-Tracked-Commit-Id: 2605085fba22792f3d4a6b856c7c5a05492d1fde
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8a3367cc8005842efcefc0cb5c29780370818572
Message-Id: <156269550705.14383.13824969277671553441.pr-tracker-bot@kernel.org>
Date:   Tue, 09 Jul 2019 18:05:07 +0000
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, dmurphy@ti.com,
        jacek.anaszewski@gmail.com, mchehab+samsung@kernel.org,
        oss@c-mauderer.de, pavel@ucw.cz, wsa+renesas@sang-engineering.com,
        yuehaibing@huawei.com
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Mon,  1 Jul 2019 18:46:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-5.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8a3367cc8005842efcefc0cb5c29780370818572

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
