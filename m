Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C349B7AA1F2
	for <lists+linux-leds@lfdr.de>; Thu, 21 Sep 2023 23:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231351AbjIUVLB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Sep 2023 17:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232944AbjIUVFM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 21 Sep 2023 17:05:12 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC53984F0C
        for <linux-leds@vger.kernel.org>; Thu, 21 Sep 2023 10:37:40 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC848C4AF69;
        Thu, 21 Sep 2023 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695293251;
        bh=pp/Ue0iJyhffHYtzdMOm63r/ONxHdXIt8bLLQR/6yi0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=IceBFM9LW3Dck4N9l5/4NGIpmgL98u3n6mCzR9h7lexzAMzRWS9OP6qFxYxxOd5Dr
         /2He4+mO3dhlgLznoZ3M4jVXK4BPc8xTAI6zh1bo44GRtpTL4/1OUlX2sg9rG7TEYa
         TYmc9yht/W6sbHcDXF5poQJlRA8JEByaIPth6URbNDdQE8XXHxXz3eQBPOL6KixILJ
         v9IoLj4uQg9TsAuMUNS0dX24DtVRVUxShthTgLYvEOJ0ami6ZETzhoWDSbnPol0TK8
         r5dGkBLpCcASlBVlb2c92+rfu4iiegs2WlEVNh5E/3HDgn1Dr+44qmFZf/MkQz+7yx
         EI3gYZGIGMUfA==
From:   Lee Jones <lee@kernel.org>
To:     linux-leds@vger.kernel.org, Stefan Eichenberger <eichest@gmail.com>
Cc:     pavel@ucw.cz, lee@kernel.org
In-Reply-To: <20230918143238.75600-1-eichest@gmail.com>
References: <20230918143238.75600-1-eichest@gmail.com>
Subject: Re: (subset) [PATCH] leds: lp55xx: use gpiod_set_value_cansleep
Message-Id: <169529325053.3610185.2120920781056406705.b4-ty@kernel.org>
Date:   Thu, 21 Sep 2023 11:47:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DATE_IN_PAST_06_12,
        DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 18 Sep 2023 16:32:38 +0200, Stefan Eichenberger wrote:
> Use gpiod_set_value_cansleep in the init_device function. Without this
> change, the driver may print a warning if the LP55xx enable pin is
> connected to a GPIO chip which can sleep (e.g. a GPIO expander):
> WARNING: CPU: 0 PID: 2719 at drivers/gpio/gpiolib.c:3051 gpiod_set_value+0x64/0xbc
> 
> 

Applied, thanks!

[1/1] leds: lp55xx: use gpiod_set_value_cansleep
      commit: e62db9d5be9bc96e121013b35987dfa850c040f9

--
Lee Jones [李琼斯]

