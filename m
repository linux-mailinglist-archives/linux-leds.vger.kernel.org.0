Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 199684589B7
	for <lists+linux-leds@lfdr.de>; Mon, 22 Nov 2021 08:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238637AbhKVHUg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Nov 2021 02:20:36 -0500
Received: from mxout70.expurgate.net ([91.198.224.70]:15816 "EHLO
        mxout70.expurgate.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhKVHUf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Nov 2021 02:20:35 -0500
Received: from [127.0.0.1] (helo=localhost)
        by relay.expurgate.net with smtp (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mp3Zt-000RBB-Ie; Mon, 22 Nov 2021 08:17:25 +0100
Received: from [195.243.126.94] (helo=securemail.tdt.de)
        by relay.expurgate.net with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <fe@dev.tdt.de>)
        id 1mp3Zs-000NSM-Uc; Mon, 22 Nov 2021 08:17:24 +0100
Received: from securemail.tdt.de (localhost [127.0.0.1])
        by securemail.tdt.de (Postfix) with ESMTP id AA3E2240041;
        Mon, 22 Nov 2021 08:17:24 +0100 (CET)
Received: from mail.dev.tdt.de (unknown [10.2.4.42])
        by securemail.tdt.de (Postfix) with ESMTP id 2F450240040;
        Mon, 22 Nov 2021 08:17:24 +0100 (CET)
Received: from mail.dev.tdt.de (localhost [IPv6:::1])
        by mail.dev.tdt.de (Postfix) with ESMTP id DE44B20281;
        Mon, 22 Nov 2021 08:17:23 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 22 Nov 2021 08:17:23 +0100
From:   Florian Eckert <fe@dev.tdt.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     robh+dt@kernel.org, Eckert.Florian@googlemail.com,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] leds: Add KTD20xx RGB LEDs driver from Kinetic
In-Reply-To: <20211109232917.GA26764@amd>
References: <20211109100822.5412-1-fe@dev.tdt.de>
 <20211109232917.GA26764@amd>
Message-ID: <05d2a86e292d6ff42b9734073899f278@dev.tdt.de>
X-Sender: fe@dev.tdt.de
User-Agent: Roundcube Webmail/1.3.16
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
        autolearn_force=no version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.dev.tdt.de
X-purgate-ID: 151534::1637565445-0000FA27-416ED97F/0/0
X-purgate: clean
X-purgate-type: clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

> If this uses non-standard interface, it will need to be
> documented. But I would like to understand the limitations first.

I have already sent you an explanation and the register description.
Did you get it? Do you need anything else?

Best regards,
Florian
