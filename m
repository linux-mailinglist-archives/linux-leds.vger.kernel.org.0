Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24CB6270F35
	for <lists+linux-leds@lfdr.de>; Sat, 19 Sep 2020 17:54:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgISPy3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 11:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbgISPy3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 11:54:29 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 857A1C0613CE;
        Sat, 19 Sep 2020 08:54:29 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id A69CE14095B;
        Sat, 19 Sep 2020 17:54:26 +0200 (CEST)
Date:   Sat, 19 Sep 2020 17:54:26 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Rod Whitby <rod@whitby.id.au>
Subject: Re: [PATCH leds v2 03/50] leds: fsg: compile if COMPILE_TEST=y
Message-ID: <20200919175426.7b13000c@nic.cz>
In-Reply-To: <20200919095616.GA14795@duo.ucw.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
        <20200917223338.14164-4-marek.behun@nic.cz>
        <20200919095616.GA14795@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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

On Sat, 19 Sep 2020 11:56:16 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> #include <mach/hardware.h>

It can't include this header on other platforms...
