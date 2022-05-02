Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68129517144
	for <lists+linux-leds@lfdr.de>; Mon,  2 May 2022 16:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237235AbiEBOMo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 May 2022 10:12:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236886AbiEBOMn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 May 2022 10:12:43 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2271D65E8
        for <linux-leds@vger.kernel.org>; Mon,  2 May 2022 07:09:15 -0700 (PDT)
X-Virus-Scanned: Yes
Message-ID: <bee0ab23-1324-6989-1d67-a6b4e9e29bdb@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1651500553;
        bh=pW4FJtJgwdaT498qCVe5KIKUn1qzAEhP/Yuh7XE4Ci0=; h=To:From:Subject;
        b=L89JZfEZsEa9asl4gWCQDLPOBFrevmcRlawBFrDpYU4OWKWhW/WkVfLTiKk/0GgMs
         iH3bg41NKXdVDHHELJNvWRnw3rzhVKo0BeI5NWuVTAffMoHTR4ukY3LilHUps6aYvR
         ct0uI+uAyUiNouU/RifOpPJxBkj2z7nUNJ9VZiDo2OnHFXZAmdrcp79JAPl+Ih2rTC
         I3pHoCnw6gKgw5FWW2bNdew9a5LOqec7dO7yDPuSiHd9e6HdsROUflEiFUc45UmpZb
         nk04vitZIz6stEoI+MmiQMjAkNIwh3RYpePsW1O8YG+4GHNw94tCohq7PpD6DOgnU2
         39LjWgCvEWMPQ==
Date:   Mon, 2 May 2022 16:09:12 +0200
Mime-Version: 1.0
To:     linux-leds@vger.kernel.org
Content-Language: en-US
From:   Sven Schwermer <sven@svenschwermer.de>
Subject: Initial multicolor LED intensities
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

Is there a way to assign initial (non-zero) intensities to the 
individual colors of a multicolor LED via the device tree?

In my use case, I'd like to assign a default trigger to a multicolor LED 
(e.g. linux,default-trigger="heartbeat"). However, since the color 
intensities are zero upon boot, I don't get a heartbeat on the 
multicolor LED.

Best regards,
Sven
