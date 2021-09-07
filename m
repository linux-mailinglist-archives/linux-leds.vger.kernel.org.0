Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 030394028A2
	for <lists+linux-leds@lfdr.de>; Tue,  7 Sep 2021 14:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344529AbhIGMWD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Sep 2021 08:22:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:36574 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242841AbhIGMV3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 7 Sep 2021 08:21:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B612610FF;
        Tue,  7 Sep 2021 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631017222;
        bh=I05oUJO5ooxVMhmHQL/GV/yvfvUjXqZSTxiEdS57Fng=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=Lu8FjSSud1pggsDoyIhZlc3iXhPXtC+fcKl7GyPKUi7ogrYmQLhadm35vnISrA2Ct
         kks11UL4w3ixtWTvIe0Y+PU/x9tSbCMrlv6pbC34bIm7QrR9TONdchp0phtLxbwcoG
         X6+uGVztesQdYY/1mQls8FOL4BsBVlu4SEud3NArTG2/WXN8MBFd8X4r3pCpaU5kCz
         TgqiZEvqnrAd68OzLkG6JVPCBZfwYNYyqfknX2xKn7hbPfMjOKjrp1VmYMqgs0y8ON
         o9myTDmB1WCl4/r7lwMwrnwNK1Pg8Lnoa1/gJ3/XBEMmuZmXfWxmUHZxXYEXTBENWJ
         Fg50MSZrDg/6A==
Date:   Tue, 7 Sep 2021 14:20:18 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     chaochao2021666@163.com
Cc:     pavel@ucw.cz, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jan.kiszk@siemens.com, 464759471@qq.com,
        chao zeng <chao.zeng@siemens.com>
Subject: Re: [PATCH 1/3] leds:triggers:Extend the kernel panic LED trigger
Message-ID: <20210907142018.45b2d114@dellmb>
In-Reply-To: <20210906135320.23134-1-chaochao2021666@163.com>
References: <20210906135320.23134-1-chaochao2021666@163.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon,  6 Sep 2021 21:53:18 +0800
chaochao2021666@163.com wrote:

> From: chao zeng <chao.zeng@siemens.com>
> 
> This commit extend panic trigger, add two new panic trigger
> "panic_on" and "panic_off" and keep the "panic" compatible with
> "panic_blink".
> 
> All the led on the "panic_on" would light and on
> the "panic_off" would turn off

We don't wont gazillion triggers, each for every possible setting.

Instead extend the existing panic trigger to have another sysfs setting
where you can set this behavior.
  echo panic >trigger
  echo blink >on_panic
So the on_panic file can accept "on", "off" or "blink".

Alternatively a pattern could be set as in the ledtrig-pattern trigger.

Also your patches do not use correct spacing in commit titles:
  leds:triggers:Extend the kernel panic LED trigger
should instead be
  leds: triggers: Extend the kernel panic LED trigger

Marek
