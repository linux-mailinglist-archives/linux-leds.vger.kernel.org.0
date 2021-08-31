Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA363FCF46
	for <lists+linux-leds@lfdr.de>; Tue, 31 Aug 2021 23:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241369AbhHaVtf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Aug 2021 17:49:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240961AbhHaVte (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 31 Aug 2021 17:49:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9BC0461056;
        Tue, 31 Aug 2021 21:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630446518;
        bh=jHcyLjtGwj/yrm1bNFOdm6UFJ+i3n0ZvAXflFin9yX0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZgRQ8TUo9Hx1HfogzU4oH622/0BxvaZsTeQt0YMDTNvrX45Ii/Id79wb9V5DltoUv
         /TXdmDBs2vGRQDzgrshZwhul4qsEJfb25fMCrCvNRyf5WGw4x58fmw9T7ndvnkpdpi
         6eIHvEXMsZNv4NKbZoAalk+B17F31ZOdbUp4Ki0v6Jaah6YsUc88GZucGu3o+0TZRQ
         Z5hxjtBZspMN5go6Iy54QFlWFT0H5XOE9AQORa4RxoOejFSNIfSyKHUZ85Rbs4AqFF
         lXI5NkGliolixwkjWgY7veIyT6ki+BBmk70OuJqreDK13uvCUVFUhHTIrw+No0M3yK
         IgP7toKhb3OUA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9754060A6C;
        Tue, 31 Aug 2021 21:48:38 +0000 (UTC)
Subject: Re: [GIT PULL] LEDs changes for v5.15-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210831180830.GA13989@duo.ucw.cz>
References: <20210831180830.GA13989@duo.ucw.cz>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210831180830.GA13989@duo.ucw.cz>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.15-rc1
X-PR-Tracked-Commit-Id: 239f32b4f161c1584cd4b386d6ab8766432a6ede
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a998a62be9cdb509491731ffe81575aa09943a32
Message-Id: <163044651861.1462.129439761225469593.pr-tracker-bot@kernel.org>
Date:   Tue, 31 Aug 2021 21:48:38 +0000
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        kernel list <linux-kernel@vger.kernel.org>,
        jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The pull request you sent on Tue, 31 Aug 2021 20:08:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/ tags/leds-5.15-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a998a62be9cdb509491731ffe81575aa09943a32

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
