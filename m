Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A01B16BD3F2
	for <lists+linux-leds@lfdr.de>; Thu, 16 Mar 2023 16:37:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231793AbjCPPhO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 16 Mar 2023 11:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbjCPPg6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 16 Mar 2023 11:36:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C7F14E83;
        Thu, 16 Mar 2023 08:34:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7289261F99;
        Thu, 16 Mar 2023 15:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8975C433EF;
        Thu, 16 Mar 2023 15:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678980795;
        bh=SScjb5dGbj4xfJ2tlEmOc0ADzu7zL+kpMfVq6nlDDBU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Fi2ZKpogJepOwSNu15YhfA5aJ4Aka38wJ88cbanbkeyEBpW6GE27bH1i/HMIKBpfD
         LxvWOJhatW+ku9RO+rOILUvb5dagC8oO7gDYyZZTlTPVonmN6wkSVSDbaZr07OhY4+
         TwQOiqJ0FCH1YxbDkg/JVqCVQwFgk/jmOLYEqWDfib4rVXnNmC7NPIeGJDU1EZf/Z4
         z6Yq6KHSv+FZ/tiwMxCgn6DpdVBotwTp09ou5l9AGLcnf8axqEV7lQG0+eE1g1qmj5
         4uProxPuR+1BkXByTb5o9NHLxz/u7sZQ90j3Pel4a16dxLQNK1OHyi0J+9COQ6C7SI
         wyjcQSRAHlR8w==
Date:   Thu, 16 Mar 2023 15:33:10 +0000
From:   Lee Jones <lee@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2 REBASED] dt-bindings: leds: add "usbport" trigger
Message-ID: <20230316153310.GI9667@google.com>
References: <20230316135546.9162-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230316135546.9162-1-zajec5@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 16 Mar 2023, Rafał Miłecki wrote:

> From: Rafał Miłecki <rafal@milecki.pl>
>
> Linux's "usbport" trigger is a bit specific one. It allows LED to follow
> state of multiple USB ports which have to be selected additionally
> (there isn't a single trigger for each port).
>
> Default list of USB ports to monitor can be specified using
> "trigger-sources" DT property. Theoretically it should be possible for
> Linux to deduce applicable trigger based on the references nodes in the
> "trigger-sources". It hasn't been implemented however (probably due to
> laziness).
>
> Milk spilled - we already have DT files specifying "usbport" manually -
> allow that value in the binding. This fixes validation of in-kernel and
> external DT files.
>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks

--
Lee Jones [李琼斯]
