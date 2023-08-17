Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5938F77F44B
	for <lists+linux-leds@lfdr.de>; Thu, 17 Aug 2023 12:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347924AbjHQK1L (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 17 Aug 2023 06:27:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349998AbjHQK1A (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Aug 2023 06:27:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A7E2D50
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 03:26:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D3FDE643CD
        for <linux-leds@vger.kernel.org>; Thu, 17 Aug 2023 10:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6564DC433C7;
        Thu, 17 Aug 2023 10:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692268018;
        bh=R92Txpg6S6ujZqQYcC2GCYMMsUQQs+FZvTkkiM6YPuQ=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=sHyNBggWBYN49NUahA8TnYC6rK207Al/lISsen197KYQyI4t++AqIEq+qToACgVTn
         JxdYBAmN2v/mJ7bgUwfQSab9NQdVAPJ1ShDT0LEIZuiLoZIFJkQ9Dp5g4xFqDiR7+/
         B/w39vWh42UnIAp54wrA2E3MdPG63rUEOMBOJ77qQDOpY4yAqdeU/tXGopWE4cxPiu
         AVJvxSeXoWsdmB6SuTHIBLYX36Jd4yRK2btvkW72Knw+/7gqBPmp9ZOmFCBUmi8KHD
         GOGTTmYiCkfIFFvUdJS/WHRq3I3tSe8vY0hwpbA9t8sfi88ty14LAY+HxH6/mDdPG1
         B7RbsI4b12Wzw==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
In-Reply-To: <20230801151623.30387-1-kabel@kernel.org>
References: <20230801151623.30387-1-kabel@kernel.org>
Subject: Re: (subset) [PATCH] leds: Fix BUG_ON check for LED_COLOR_ID_MULTI
 that is always false
Message-Id: <169226801715.965615.18045931116700185458.b4-ty@kernel.org>
Date:   Thu, 17 Aug 2023 11:26:57 +0100
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

On Tue, 01 Aug 2023 17:16:23 +0200, Marek Behún wrote:
> At the time we call
>     BUG_ON(props.color == LED_COLOR_ID_MULTI);
> the props variable is still initialized to zero.
> 
> Call the BUG_ON only after we parse fwnode into props.
> 
> 
> [...]

Applied, thanks!

[1/1] leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is always false
      commit: c3f853184bed04105682383c2971798c572226b5

--
Lee Jones [李琼斯]

