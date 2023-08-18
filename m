Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA7C780835
	for <lists+linux-leds@lfdr.de>; Fri, 18 Aug 2023 11:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359043AbjHRJYC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Aug 2023 05:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238613AbjHRJXp (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Aug 2023 05:23:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A032D72
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 02:23:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D31C662DA
        for <linux-leds@vger.kernel.org>; Fri, 18 Aug 2023 09:23:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92DC3C433C7;
        Fri, 18 Aug 2023 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692350623;
        bh=BAvzdPwIy0oxC+OOYlu4Xt5KMPapL26AmMFME60rrG4=;
        h=From:To:In-Reply-To:References:Subject:Date:From;
        b=CrezfxKRM/xSlzmiVa7tK6m42nCUICoOWSPBIV3GFefuSHxUOr2Oo9CNo5v6GMGiX
         xkGI+NnebsxdF+vIHK503W94qwXfXnsqq0ywaLlhPJa6WKNzz4OU6XTbsEZg3MnBfM
         JWMY6ChP6SkvJ1Ay1BrY3p/vMKjtlffRqYJaiatsOfB3gggY0vnwQpqSNVWxJL3baN
         W7a1rHqTjRuDlFw9LqWR0bJudoDdKcdlPTGCVUD1GKjpTylY0Glo4RaymGE/yKIHLt
         w7F3+/R2k6vlvHGaN/gEFEdGD8EvAyga6MGNVcjQ71Duq9ZB7lAMj/18K9Prwm/h5V
         ibidLykQZDdkQ==
From:   Lee Jones <lee@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org,
        =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
In-Reply-To: <20230802160748.11208-2-kabel@kernel.org>
References: <20230802160748.11208-1-kabel@kernel.org>
 <20230802160748.11208-2-kabel@kernel.org>
Subject: Re: (subset) [PATCH v3 1/6] leds: turris-omnia: drop unnecessary
 mutex locking
Message-Id: <169235062215.1209924.8957279341138056461.b4-ty@kernel.org>
Date:   Fri, 18 Aug 2023 10:23:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 02 Aug 2023 18:07:43 +0200, Marek Behún wrote:
> Do not lock driver mutex in the global LED panel brightness sysfs
> accessors brightness_show() and brightness_store().
> 
> The mutex locking is unnecessary here. The I2C transfers are guarded by
> I2C core locking mechanism, and the LED commands itself do not interfere
> with other commands.
> 
> [...]

Applied, thanks!

[1/6] leds: turris-omnia: drop unnecessary mutex locking
      commit: 760b6b7925bf09491aafa4727eef74fc6bf738b0

--
Lee Jones [李琼斯]

