Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9203A4623D8
	for <lists+linux-leds@lfdr.de>; Mon, 29 Nov 2021 22:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232342AbhK2WCT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Nov 2021 17:02:19 -0500
Received: from mail-oo1-f51.google.com ([209.85.161.51]:43961 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbhK2WAT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Nov 2021 17:00:19 -0500
Received: by mail-oo1-f51.google.com with SMTP id w5-20020a4a2745000000b002c2649b8d5fso6088132oow.10;
        Mon, 29 Nov 2021 13:57:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AlxxINDiWUci/ghmIxsuPQpIV54MyS+Bu7C4d32tupQ=;
        b=sasSLehU+mBCTu1jifdYpRLsf7fkNKD1gquu4vGEbjPTWSPcT/MVmuzhDO1x71YPgO
         lGDBLn2K14KCdKPVbyG3lzAtxiAMavK65tn4e/jDYKCk8bfgmVZXhVsk1WmrzbpMel2J
         DUOflGhRNwXPHOXGEYA058bCW+/QsL3C38AjhRr/fIZNyQLyCSJKf4aENlsOVaxs7wXr
         6p2xEm0heHNcAGOi04h1qLQnwq5S3Qh9sEdBaWMMsju8CCp6fZ+DBfAzwIGfehvh/xVG
         YobL30oUJipwelvJYVld8/w5K4YAcQpP5tFgjfKpnr9BseQHVBtCfTOe0dVFxc+qsM7X
         2FVA==
X-Gm-Message-State: AOAM531IQD1aBoNNomMsZDGZpQSZFyDT7LXLlLfOp1GCrGY6I9tLrdDb
        hg6XsCj5GEb9fk3TrIuB5A==
X-Google-Smtp-Source: ABdhPJzBNGk7rkhtpm0iLpEjI9ZpBXIrrKgO7FLKorYIguNApTIjpxpWE44tZc0OfW9GxrLVKLuWLw==
X-Received: by 2002:a4a:d453:: with SMTP id p19mr33024951oos.85.1638223020792;
        Mon, 29 Nov 2021 13:57:00 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s2sm2846677otr.69.2021.11.29.13.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 13:57:00 -0800 (PST)
Received: (nullmailer pid 681275 invoked by uid 1000);
        Mon, 29 Nov 2021 21:56:59 -0000
Date:   Mon, 29 Nov 2021 15:56:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        bcm-kernel-feedback-list@broadcom.com,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: convert BCM6328 controller to the
 json-schema
Message-ID: <YaVMq6jPq/vcOuk5@robh.at.kernel.org>
References: <20211114225416.3174-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211114225416.3174-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 14 Nov 2021 23:54:16 +0100, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../devicetree/bindings/leds/leds-bcm6328.txt | 319 --------------
>  .../bindings/leds/leds-bcm6328.yaml           | 403 ++++++++++++++++++
>  2 files changed, 403 insertions(+), 319 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328.txt
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-bcm6328.yaml
> 

I added 'maximum: 23' on 'reg' and applied, thanks!
