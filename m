Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 940C877B292
	for <lists+linux-leds@lfdr.de>; Mon, 14 Aug 2023 09:34:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjHNHeF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 14 Aug 2023 03:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234260AbjHNHds (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 14 Aug 2023 03:33:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B129E5B
        for <linux-leds@vger.kernel.org>; Mon, 14 Aug 2023 00:33:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EE691640A3
        for <linux-leds@vger.kernel.org>; Mon, 14 Aug 2023 07:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB2BC433C8;
        Mon, 14 Aug 2023 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691998425;
        bh=mJSRpp66ZJfROX44qf4qAv2ZbFJ+rujHDYMjJD8+VzE=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=ITp89f1fveJmpyKhS7QxpU9Y5Pxsb5JjnUzUwGRlQ4hAwZ3d3eCYOv9vWg8bVQcA2
         BA+e59zi1cJcCbGQpnogySUrLlf17m02c1h21sEJDwMluzdYOV1TzlolfhjcvxEjCc
         MEzL5rd4t6zZX8hd+C7DURuM0TAMYYy5JvKE9VSj0y8L5ZdODASHRypBzWcKBzxZo3
         +m0vtOTuTuaCl/Oa+iAr0Br0kyVFORT9h4PI/txH92Jpea3EwZ6p7WwEw1O6Qq1tYL
         aHc0cUHnxsqpef3USENEp9gnJuuL+6hIjaSkmtNTzAgpX20uzFCvnkcQEkpTCJ65fF
         0QN0KfGWE8Q6g==
Date:   Mon, 14 Aug 2023 09:33:41 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 0/6] leds: turris-omnia: updates
Message-ID: <20230814093341.3329d4ed@dellmb>
In-Reply-To: <20230802160748.11208-1-kabel@kernel.org>
References: <20230802160748.11208-1-kabel@kernel.org>
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

Any comments on this series?

Marek
