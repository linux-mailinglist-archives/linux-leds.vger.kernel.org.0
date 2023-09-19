Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F158A7A5CC8
	for <lists+linux-leds@lfdr.de>; Tue, 19 Sep 2023 10:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjISImR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Sep 2023 04:42:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjISImQ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Sep 2023 04:42:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F582115
        for <linux-leds@vger.kernel.org>; Tue, 19 Sep 2023 01:42:11 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7D9C433C8;
        Tue, 19 Sep 2023 08:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695112931;
        bh=qD38TKKylZ4JX4A4DlNvR6UmV6MnJe8R3TbHkspBPFA=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=CaFdshVezasrmJIg/CwR1yKrTOPYmtSqnl9ahpKjiU3xsrD/dhngKlskFB3s6nbei
         8DgwPjFSqNNvecSZy8HnjE2015CWJcKZWTIWV8vnUlzaJZN0WenpHb96faktVGRpJD
         W3Pqv7KWoRBjfpIYVuz3iY86vqVsgdJtdYCXKKTnSm9nciyE0JFro1zHRwtwTzurpu
         xYB/B2ejY9L/UtciNv9ffwE2johte5l7bAGpkrmpp4a0yEFNumM1CRlVfoS5EDwF0m
         yzkg/jwGBGCZ/mlgrNVJfBy9y9D5ZbPT33rpzWqiL2b4UbyBax67HfHso4IYrl6ddr
         I7EAYx7/jc6sQ==
Date:   Tue, 19 Sep 2023 10:42:07 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH] leds: Drop BUG_ON check for LED_COLOR_ID_MULTI
Message-ID: <20230919104207.7bf1b237@dellmb>
In-Reply-To: <20230918140724.18634-1-kabel@kernel.org>
References: <20230918140724.18634-1-kabel@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

Greg tells me to pester LED maintainers to get this into Linus' tree
soon, so that we can avoid stable incosistencies (see
https://lore.kernel.org/stable/2023091901-vessel-giggling-55ee@gregkh/).

Sorry about the inconvenience, this would not happen if this was not
sent into stable in the first place, which is my fault, since I added
the Fixes tag.

Marek
