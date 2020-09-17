Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D48F26DF8E
	for <lists+linux-leds@lfdr.de>; Thu, 17 Sep 2020 17:24:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728102AbgIQPYM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Sep 2020 11:24:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728116AbgIQPYD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 11:24:03 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E8BC06174A;
        Thu, 17 Sep 2020 08:23:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 13668140A58;
        Thu, 17 Sep 2020 17:23:48 +0200 (CEST)
Date:   Thu, 17 Sep 2020 17:23:47 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        David Rivshin <drivshin@allworx.com>
Subject: Re: [PATCH leds v1 07/10] leds: is31fl32xx: use struct
 led_init_data when registering
Message-ID: <20200917172347.41c3dacf@nic.cz>
In-Reply-To: <20200916231650.11484-8-marek.behun@nic.cz>
References: <20200916231650.11484-1-marek.behun@nic.cz>
        <20200916231650.11484-8-marek.behun@nic.cz>
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

This can be done without refactoring, please ignore this patch in this
spin.
