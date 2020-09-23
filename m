Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30A9F27587A
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 15:14:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726620AbgIWNOr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Wed, 23 Sep 2020 09:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726130AbgIWNOq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Sep 2020 09:14:46 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B37F6C0613CE;
        Wed, 23 Sep 2020 06:14:46 -0700 (PDT)
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id ADE1E140818;
        Wed, 23 Sep 2020 15:14:43 +0200 (CEST)
Date:   Wed, 23 Sep 2020 15:14:43 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Dan Murphy <dmurphy@ti.com>
Cc:     <pavel@ucw.cz>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] leds: lm3552: Fix warnings for undefined parameters
Message-ID: <20200923151443.595e7b43@nic.cz>
In-Reply-To: <20200922190638.5323-1-dmurphy@ti.com>
References: <20200922190638.5323-1-dmurphy@ti.com>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Wrong subject, it says
  lm3552
but driver is called
  lm3532

Besides this:

Reviewed-by: Marek Behún <kabel@kernel.org>
