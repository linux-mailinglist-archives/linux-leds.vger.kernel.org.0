Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2C22D7623
	for <lists+linux-leds@lfdr.de>; Fri, 11 Dec 2020 14:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405954AbgLKM6p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Dec 2020 07:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405977AbgLKM62 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Dec 2020 07:58:28 -0500
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A257AC0613D3;
        Fri, 11 Dec 2020 04:57:47 -0800 (PST)
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 8EC22140A85;
        Fri, 11 Dec 2020 13:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1607691464; bh=XxSgouCReAfpmA+hWhEGm9ZmSmoHdWCMFQka3gjL/kM=;
        h=Date:From:To;
        b=FjFqw9rZqhlsyqZt9b85eyrq+HFUp5ZRDNZF5RBckv7qQebzAaIDM2aWttAWWvgOm
         WwDHDTPqrMIVN3td27fCw42NxypjbqNsq86+eAA+I0wZofzIfjpif2PQ/5oa2lavjF
         gOX/sw/OtwTC68MkaWpYALK89qtD/Hs3TlQLxhqA=
Date:   Fri, 11 Dec 2020 13:56:28 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Abanoub Sameh <abanoubsameh8@gmail.com>
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abanoub Sameh <abanoubsameh@protonmail.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] leds: led-core: Get rid of enum led_brightness
Message-ID: <20201211135628.1fe1af79@nic.cz>
In-Reply-To: <20201211014840.1554095-1-abanoubsameh@protonmail.com>
References: <20201211014840.1554095-1-abanoubsameh@protonmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 11 Dec 2020 03:48:40 +0200
Abanoub Sameh <abanoubsameh8@gmail.com> wrote:

> This gets rid of enum led_brightness in the main led files,
> because it is deprecated, and an int can be used instead,
> or maybe even a uint8_t since it only goes up to 255.
> Next we can also patch the other files to get rid of it completely.

1. unsigned int should be used IMO
  - using int may force all implementers to check for negative value
    and return -EINVAL, which is stupid
  - some LED controllers may offer more than 8bit brightness value, so
    no uint8_t
2. I think we should remove all usages with one commit

Marek
