Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 526777CF86C
	for <lists+linux-leds@lfdr.de>; Thu, 19 Oct 2023 14:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235422AbjJSMKx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Oct 2023 08:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235429AbjJSMKe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Oct 2023 08:10:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 998291AD
        for <linux-leds@vger.kernel.org>; Thu, 19 Oct 2023 05:08:23 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4D46C433C7;
        Thu, 19 Oct 2023 12:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697717301;
        bh=9t4TnbZH/9CvYW2RzAU3HCGkxn3r+Xji/RU72i1dw00=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=UEnuHApVSok8GuQhlWGp3z57zt5sZJqKAWh+bqAdl414ED7L+jR1uNcCBzCl3PdRa
         OHsQmEzSTAF0GdUdIIlOHuJfvASxtPccVubWFDe0/K5ON+PW5Qzk2QCfMFRG7d8YDk
         +Ebh1myZHxloUOaVBiMvD0LTWq5Fp7meu1wAE/7qgkN3r/qbrkLQGxy37T6XrhLMO2
         Rcv3FkIDE+zGYelT+vUI+r1J21rKP3aQdjl/ZOuEJql2HGHnF3ZY4qe2/MbW96UsJJ
         fJJCHt2FSIvww8Yf+6P2ojwv0KdztFlqpGwnbjMaN8QEBWDUn6tNrrigXrWfO5CI/K
         1WohRV8e/BJRA==
From:   Lee Jones <lee@kernel.org>
To:     Lee Jones <lee@kernel.org>,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org,
        =?utf-8?q?Marek_Moj=C3=ADk?= <marek.mojik@nic.cz>
In-Reply-To: <20231016141538.30037-1-kabel@kernel.org>
References: <20231016141538.30037-1-kabel@kernel.org>
Subject: Re: (subset) [PATCH] leds: turris-omnia: Fix brightness setting
 and trigger activating
Message-Id: <169771730067.2462718.13976120509366125466.b4-ty@kernel.org>
Date:   Thu, 19 Oct 2023 13:08:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 16 Oct 2023 16:15:38 +0200, Marek Behún wrote:
> I have improperly refactored commits
>   4d5ed2621c24 ("leds: turris-omnia: Make set_brightness() more efficient")
> and
>   aaf38273cf76 ("leds: turris-omnia: Support HW controlled mode via private trigger")
> after Lee requested a change in API semantics of the new functions I
> introduced in commit
>   28350bc0ac77 ("leds: turris-omnia: Do not use SMBUS calls").
> 
> [...]

Applied, thanks!

[1/1] leds: turris-omnia: Fix brightness setting and trigger activating
      commit: a775c69e55c92da187c6286a04088acc3827a73e

--
Lee Jones [李琼斯]

